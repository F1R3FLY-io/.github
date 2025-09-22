# F1R3FLY.io API Documentation Standards

## Purpose

This document establishes comprehensive API documentation standards for all F1R3FLY.io projects to ensure consistency, clarity, and maintainability across the ecosystem.

## API Documentation Requirements

### 1. OpenAPI Specification (REST APIs)

All HTTP REST APIs MUST provide OpenAPI 3.0+ specifications with:

#### Required Elements
```yaml
openapi: 3.0.3
info:
  title: [Project Name] API
  description: [Comprehensive API description]
  version: [Semantic version]
  contact:
    name: F1R3FLY.io Team
    email: f1r3fly.ceo@gmail.com
  license:
    name: Apache 2.0
    url: https://www.apache.org/licenses/LICENSE-2.0
servers:
  - url: https://api.example.com/v1
    description: Production server
  - url: https://staging-api.example.com/v1
    description: Staging server
```

#### Authentication Documentation
```yaml
components:
  securitySchemes:
    bearerAuth:
      type: http
      scheme: bearer
      bearerFormat: JWT
    apiKey:
      type: apiKey
      in: header
      name: X-API-Key
```

#### Rate Limiting Documentation
Every endpoint MUST document rate limits:
```yaml
paths:
  /resource:
    get:
      x-rate-limit:
        requests: 100
        window: 60s
      responses:
        429:
          description: Rate limit exceeded
          headers:
            X-RateLimit-Limit:
              schema:
                type: integer
            X-RateLimit-Remaining:
              schema:
                type: integer
            X-RateLimit-Reset:
              schema:
                type: integer
```

### 2. gRPC Documentation (Service APIs)

All gRPC services MUST provide:

#### Protocol Buffer Documentation
```protobuf
syntax = "proto3";

package f1r3fly.service.v1;

// Service documentation describing purpose and usage
service ExampleService {
  // Method documentation with request/response details
  rpc GetExample(GetExampleRequest) returns (GetExampleResponse) {
    option (google.api.http) = {
      get: "/v1/examples/{id}"
    };
  }
}

// Message documentation with field descriptions
message GetExampleRequest {
  // Unique identifier for the example
  string id = 1;
}
```

#### Service Documentation Template
```markdown
## Service: [ServiceName]

### Purpose
[Service description and use cases]

### Authentication
[Authentication method and requirements]

### Methods
| Method | Description | Request | Response |
|--------|-------------|---------|----------|
| GetExample | Retrieves example | GetExampleRequest | GetExampleResponse |

### Error Codes
| Code | Description | Recovery |
|------|-------------|----------|
| INVALID_ARGUMENT | Invalid request | Check request format |
| NOT_FOUND | Resource not found | Verify resource exists |
```

### 3. GraphQL Documentation

For GraphQL APIs, provide:

#### Schema Documentation
```graphql
"""
Main application schema
"""
schema {
  query: Query
  mutation: Mutation
  subscription: Subscription
}

"""
Query root for all read operations
"""
type Query {
  """
  Retrieves a user by ID

  Arguments:
    id: Unique user identifier

  Returns: User object or null if not found
  """
  user(id: ID!): User
}
```

### 4. WebSocket Documentation

For WebSocket APIs, document:

#### Connection Protocol
```markdown
## WebSocket Endpoint: /ws

### Connection
- URL: `wss://api.example.com/ws`
- Protocols: `["v1.json"]`
- Authentication: Bearer token in `Authorization` header

### Message Format
```json
{
  "type": "subscribe|unsubscribe|message",
  "channel": "channel_name",
  "data": {}
}
```

### Events
| Event | Description | Payload |
|-------|-------------|---------|
| connected | Connection established | `{sessionId: string}` |
| error | Error occurred | `{code: number, message: string}` |
```

## Documentation Structure

### API Directory Layout
```
docs/api/
├── openapi/
│   ├── openapi.yaml          # Main OpenAPI specification
│   ├── schemas/              # Reusable schemas
│   └── examples/             # Request/response examples
├── grpc/
│   ├── *.proto               # Protocol buffer definitions
│   └── service-docs.md       # Service documentation
├── graphql/
│   ├── schema.graphql        # GraphQL schema
│   └── queries.md            # Query examples
├── websocket/
│   └── events.md             # WebSocket event documentation
├── authentication.md         # Auth flow documentation
├── rate-limiting.md          # Rate limit policies
├── versioning.md             # API versioning strategy
└── changelog.md              # API change history
```

## Example Documentation

### Complete Endpoint Documentation

```yaml
/api/v1/agents:
  post:
    summary: Create AI Agent
    description: |
      Creates a new AI agent with specified configuration.
      Requires authentication and appropriate permissions.
    operationId: createAgent
    tags:
      - AI Agents
    security:
      - bearerAuth: []
    requestBody:
      required: true
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/CreateAgentRequest'
          examples:
            basic:
              value:
                name: "Assistant Bot"
                model: "gpt-4"
                temperature: 0.7
    responses:
      201:
        description: Agent created successfully
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Agent'
        headers:
          Location:
            description: URL of created resource
            schema:
              type: string
      400:
        description: Invalid request
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Error'
      401:
        description: Authentication required
      403:
        description: Insufficient permissions
      429:
        description: Rate limit exceeded
```

## Documentation Generation

### Automated Generation Tools

1. **OpenAPI**: Use code-first generation where possible
   - Rust: `poem-openapi`, `utoipa`
   - TypeScript: `tsoa`, `nestjs/swagger`
   - Go: `swaggo/swag`

2. **gRPC**: Generate documentation from proto files
   - `protoc-gen-doc` for HTML/Markdown
   - `grpc-gateway` for REST endpoints

3. **GraphQL**: Auto-generate from schema
   - `graphql-markdown` for documentation
   - GraphQL Playground for interactive docs

## Documentation Requirements Checklist

- [ ] API overview and purpose
- [ ] Authentication methods and flows
- [ ] Rate limiting policies
- [ ] Versioning strategy
- [ ] Base URLs for all environments
- [ ] Complete endpoint/method documentation
- [ ] Request/response schemas
- [ ] Error codes and handling
- [ ] Example requests and responses
- [ ] SDK/client library references
- [ ] Changelog with breaking changes
- [ ] Migration guides for version updates
- [ ] Performance considerations
- [ ] Security considerations
- [ ] CORS policies (for web APIs)

## Best Practices

1. **Consistency**: Use consistent naming conventions across all APIs
2. **Completeness**: Document all endpoints, including internal ones
3. **Examples**: Provide working examples for common use cases
4. **Versioning**: Clearly document version differences
5. **Deprecation**: Mark deprecated endpoints with migration paths
6. **Testing**: Include curl/httpie examples for testing
7. **SDKs**: Reference or provide client libraries
8. **Monitoring**: Document metrics and health endpoints

## Validation

All API documentation MUST pass validation:

1. OpenAPI specifications must validate against OpenAPI 3.0+ schema
2. Proto files must compile without errors
3. GraphQL schemas must be valid
4. Examples must be executable
5. Links must be valid (no 404s)

## References

- [OpenAPI Specification](https://swagger.io/specification/)
- [gRPC Documentation Best Practices](https://grpc.io/docs/)
- [GraphQL Best Practices](https://graphql.org/learn/best-practices/)
- [REST API Guidelines](https://github.com/microsoft/api-guidelines)

---

*This standard applies to all F1R3FLY.io projects. Updates require review and approval.*