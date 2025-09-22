# F1R3FLY.io Deployment Standards

## Purpose

Establish comprehensive deployment standards and best practices for all F1R3FLY.io projects to ensure consistent, reliable, and secure deployments across environments.

## Deployment Philosophy

- **Infrastructure as Code**: All infrastructure defined in version control
- **Environment Parity**: Development, staging, and production should be as similar as possible
- **Immutable Infrastructure**: Deploy new instances rather than modifying existing ones
- **Zero-Downtime Deployments**: Deployments should not interrupt service
- **Rollback Ready**: Always maintain ability to quickly rollback

## Environment Standards

### Environment Hierarchy

```yaml
environments:
  development:
    purpose: "Local development and testing"
    deployment: "Manual or automatic on commit"
    data: "Mock/synthetic data"
    monitoring: "Basic logging"

  staging:
    purpose: "Pre-production testing and validation"
    deployment: "Automatic on merge to develop"
    data: "Production-like test data"
    monitoring: "Full monitoring stack"

  production:
    purpose: "Live user-facing services"
    deployment: "Manual approval required"
    data: "Real user data"
    monitoring: "Full monitoring with alerting"
```

### Environment Configuration

Each environment MUST have:

```yaml
environment_config:
  infrastructure:
    compute: "Kubernetes cluster or container service"
    storage: "Persistent volumes with backups"
    networking: "Load balancers, ingress controllers"
    security: "TLS certificates, secrets management"

  observability:
    logging: "Centralized log aggregation"
    metrics: "Application and infrastructure metrics"
    tracing: "Distributed tracing for microservices"
    alerting: "On-call and notification system"

  data:
    databases: "Managed database services"
    caching: "Redis/Memcached clusters"
    messaging: "Message queues/event streams"
    storage: "Object storage for files/artifacts"
```

## Container Standards

### Dockerfile Best Practices

```dockerfile
# Multi-stage build for Rust applications
FROM rust:1.75-slim AS builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Create app user
RUN useradd -m -u 1001 appuser

WORKDIR /app
COPY Cargo.toml Cargo.lock ./
COPY src/ src/

# Build application
RUN cargo build --release

# Runtime stage
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

# Create app user
RUN useradd -m -u 1001 appuser

# Copy application
COPY --from=builder /app/target/release/app /usr/local/bin/app
COPY --chown=appuser:appuser static/ /app/static/

# Switch to non-root user
USER appuser
WORKDIR /app

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

EXPOSE 8080
CMD ["app"]
```

### Container Security

```yaml
security_requirements:
  base_images:
    - Use official base images
    - Scan for vulnerabilities
    - Update regularly
    - Use specific tags, not 'latest'

  runtime:
    - Run as non-root user
    - Use read-only filesystems where possible
    - Drop unnecessary capabilities
    - Set resource limits

  secrets:
    - Never include secrets in images
    - Use secrets management systems
    - Rotate secrets regularly
    - Audit secret access
```

## Kubernetes Deployment

### Deployment Manifests

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: embers-api
  labels:
    app: embers-api
    version: v1.0.0
spec:
  replicas: 3
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
  selector:
    matchLabels:
      app: embers-api
  template:
    metadata:
      labels:
        app: embers-api
        version: v1.0.0
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 1001
        fsGroup: 1001
      containers:
      - name: api
        image: f1r3fly/embers-api:v1.0.0
        ports:
        - containerPort: 8080
          name: http
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: embers-secrets
              key: database-url
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 8080
          initialDelaySeconds: 5
          periodSeconds: 5
```

### Service and Ingress

```yaml
# service.yaml
apiVersion: v1
kind: Service
metadata:
  name: embers-api-service
spec:
  selector:
    app: embers-api
  ports:
  - port: 80
    targetPort: 8080
    name: http

---
# ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: embers-api-ingress
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-prod
    nginx.ingress.kubernetes.io/rate-limit: "100"
spec:
  tls:
  - hosts:
    - api.embers.f1r3fly.io
    secretName: embers-api-tls
  rules:
  - host: api.embers.f1r3fly.io
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: embers-api-service
            port:
              number: 80
```

## CI/CD Pipeline Standards

### GitHub Actions Workflow

```yaml
name: Deploy to Production
on:
  push:
    tags:
      - 'v*'

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: f1r3fly/embers-api

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to Container Registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          tags: |
            type=ref,event=tag
            type=semver,pattern={{version}}

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4

      - name: Configure kubectl
        run: |
          echo "${{ secrets.KUBECONFIG }}" | base64 -d > kubeconfig
          export KUBECONFIG=kubeconfig

      - name: Deploy to Kubernetes
        run: |
          kubectl set image deployment/embers-api \
            api=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.ref_name }}
          kubectl rollout status deployment/embers-api
```

## Database Deployment

### Migration Standards

```yaml
migration_requirements:
  versioning:
    - Use sequential numbering (001, 002, etc.)
    - Include timestamp in filename
    - Never modify existing migrations

  structure:
    up_migration: "Forward migration script"
    down_migration: "Rollback script (required)"
    testing: "Migration testing on copy of production data"

  deployment:
    - Run migrations before application deployment
    - Validate migrations in staging first
    - Monitor migration performance
    - Have rollback plan ready
```

### Database Migration Example

```sql
-- migrations/20250122_001_create_agents_table.up.sql
CREATE TABLE agents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    model VARCHAR(100) NOT NULL,
    temperature DECIMAL(3,2) DEFAULT 0.7,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_agents_name ON agents(name);
CREATE INDEX idx_agents_created_at ON agents(created_at);

-- migrations/20250122_001_create_agents_table.down.sql
DROP INDEX IF EXISTS idx_agents_created_at;
DROP INDEX IF EXISTS idx_agents_name;
DROP TABLE IF EXISTS agents;
```

## Monitoring and Observability

### Required Metrics

```yaml
application_metrics:
  http_requests:
    - request_count_total
    - request_duration_seconds
    - request_size_bytes
    - response_size_bytes

  business_metrics:
    - active_users_total
    - agents_created_total
    - transactions_processed_total
    - errors_total

infrastructure_metrics:
  compute:
    - cpu_usage_percent
    - memory_usage_bytes
    - disk_usage_percent
    - network_io_bytes

  database:
    - connection_pool_size
    - query_duration_seconds
    - active_connections
    - slow_queries_total
```

### Health Check Endpoints

```rust
// Health check implementation
#[derive(serde::Serialize)]
struct HealthStatus {
    status: String,
    version: String,
    timestamp: String,
    dependencies: Vec<DependencyStatus>,
}

#[derive(serde::Serialize)]
struct DependencyStatus {
    name: String,
    status: String,
    response_time_ms: u64,
}

async fn health_check() -> Result<Json<HealthStatus>, Error> {
    let mut dependencies = Vec::new();

    // Check database
    let db_start = Instant::now();
    let db_status = check_database().await;
    dependencies.push(DependencyStatus {
        name: "database".to_string(),
        status: if db_status { "healthy" } else { "unhealthy" }.to_string(),
        response_time_ms: db_start.elapsed().as_millis() as u64,
    });

    // Check external services
    let blockchain_start = Instant::now();
    let blockchain_status = check_blockchain().await;
    dependencies.push(DependencyStatus {
        name: "blockchain".to_string(),
        status: if blockchain_status { "healthy" } else { "unhealthy" }.to_string(),
        response_time_ms: blockchain_start.elapsed().as_millis() as u64,
    });

    let overall_status = if dependencies.iter().all(|d| d.status == "healthy") {
        "healthy"
    } else {
        "unhealthy"
    };

    Ok(Json(HealthStatus {
        status: overall_status.to_string(),
        version: env!("CARGO_PKG_VERSION").to_string(),
        timestamp: chrono::Utc::now().to_rfc3339(),
        dependencies,
    }))
}
```

## Security in Deployment

### Secrets Management

```yaml
secrets_management:
  development:
    method: ".env files (git-ignored)"
    rotation: "Manual"
    access: "All developers"

  staging:
    method: "Kubernetes secrets"
    rotation: "Monthly"
    access: "DevOps team"

  production:
    method: "External secrets operator (AWS/Azure/GCP)"
    rotation: "Weekly"
    access: "Minimal, audited"
```

### Network Security

```yaml
network_security:
  ingress:
    - TLS termination at load balancer
    - Web Application Firewall (WAF)
    - DDoS protection
    - Rate limiting

  egress:
    - Restrict outbound connections
    - Monitor external API calls
    - Use private endpoints where possible

  internal:
    - Service mesh for inter-service communication
    - Network policies for pod-to-pod communication
    - Encrypt internal traffic
```

## Disaster Recovery

### Backup Strategy

```yaml
backup_requirements:
  databases:
    frequency: "Daily full, hourly incremental"
    retention: "30 days local, 90 days offsite"
    testing: "Monthly restore tests"
    encryption: "AES-256 encryption at rest"

  application_data:
    frequency: "Daily"
    retention: "7 days local, 30 days offsite"
    testing: "Weekly integrity checks"

  infrastructure:
    frequency: "Daily configuration snapshots"
    retention: "30 days"
    testing: "Quarterly disaster recovery drills"
```

### Recovery Time Objectives (RTO)

| Service Tier | RTO Target | RPO Target | Recovery Strategy |
|--------------|------------|------------|-------------------|
| Critical | 15 minutes | 1 hour | Active-active failover |
| Important | 1 hour | 4 hours | Active-passive failover |
| Standard | 4 hours | 8 hours | Backup restoration |

## Deployment Checklist

### Pre-Deployment
- [ ] Code review completed
- [ ] Tests passing (unit, integration, e2e)
- [ ] Security scan completed
- [ ] Database migrations tested
- [ ] Feature flags configured
- [ ] Monitoring dashboards ready
- [ ] Rollback plan documented

### Deployment
- [ ] Deployment initiated from approved branch/tag
- [ ] Health checks passing
- [ ] Database migrations completed
- [ ] Configuration updated
- [ ] Certificates valid
- [ ] External dependencies accessible

### Post-Deployment
- [ ] Application health verified
- [ ] Key user journeys tested
- [ ] Metrics and alerts configured
- [ ] Performance baselines established
- [ ] Documentation updated
- [ ] Stakeholders notified

## Performance Standards

### Service Level Objectives (SLOs)

```yaml
availability:
  target: 99.9%
  measurement: "Uptime monitoring"

latency:
  p50: 100ms
  p95: 500ms
  p99: 1000ms
  measurement: "HTTP request duration"

error_rate:
  target: <0.1%
  measurement: "HTTP 5xx responses / total requests"

throughput:
  target: 1000 req/s
  measurement: "Requests per second"
```

## Documentation Requirements

Each deployment MUST include:

- **Deployment Guide** - Step-by-step deployment instructions
- **Runbook** - Operational procedures and troubleshooting
- **Architecture Diagram** - Infrastructure and service topology
- **Configuration Reference** - Environment variables and settings
- **Recovery Procedures** - Disaster recovery and rollback steps

---

*These deployment standards apply to all F1R3FLY.io projects. Deviations require architecture review and documentation.*