# F1R3FLY.io Testing Standards

## Purpose

Establish comprehensive testing standards across all F1R3FLY.io projects to ensure code quality, reliability, and maintainability.

## Testing Philosophy

- **Test-Driven Development (TDD)**: Write tests before implementation
- **Comprehensive Coverage**: Target 80%+ code coverage, 90%+ for critical paths
- **Fast Feedback**: Tests should run quickly and provide clear results
- **Documentation**: Tests serve as living documentation of expected behavior

## Testing Pyramid

```
        /\
       /  \        E2E Tests (5%)
      /    \       - User journeys
     /──────\      - Critical paths
    /        \
   /          \    Integration Tests (25%)
  /            \   - API contracts
 /──────────────\  - Service interactions
/                \
|                | Unit Tests (70%)
|________________| - Business logic
                   - Pure functions
                   - Component behavior
```

## Testing Categories

### 1. Unit Tests

**Purpose**: Test individual components in isolation

#### Standards
- Test single responsibility
- Mock external dependencies
- Fast execution (<100ms per test)
- Clear test names describing behavior

#### Rust Example
```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calculate_fee_returns_correct_amount() {
        // Arrange
        let amount = 1000;
        let fee_rate = 0.03;

        // Act
        let fee = calculate_fee(amount, fee_rate);

        // Assert
        assert_eq!(fee, 30);
    }

    #[tokio::test]
    async fn async_operation_completes_successfully() {
        // Async test implementation
    }
}
```

#### TypeScript Example
```typescript
describe('UserService', () => {
  let service: UserService;
  let mockRepository: jest.Mocked<UserRepository>;

  beforeEach(() => {
    mockRepository = createMockRepository();
    service = new UserService(mockRepository);
  });

  it('should create user with valid data', async () => {
    // Arrange
    const userData = { name: 'Test User', email: 'test@example.com' };
    mockRepository.save.mockResolvedValue({ id: '1', ...userData });

    // Act
    const user = await service.createUser(userData);

    // Assert
    expect(user).toHaveProperty('id');
    expect(mockRepository.save).toHaveBeenCalledWith(userData);
  });
});
```

### 2. Integration Tests

**Purpose**: Test interaction between components

#### Standards
- Test API contracts
- Verify data flow
- Use test databases/services
- Clean up test data

#### API Integration Test (Python)
```python
import pytest
from httpx import AsyncClient

@pytest.mark.asyncio
async def test_create_and_retrieve_agent():
    """Test creating an agent and retrieving it."""
    async with AsyncClient(base_url="http://test-api") as client:
        # Create agent
        create_response = await client.post(
            "/api/v1/agents",
            json={"name": "Test Agent", "model": "gpt-4"}
        )
        assert create_response.status_code == 201
        agent_id = create_response.json()["id"]

        # Retrieve agent
        get_response = await client.get(f"/api/v1/agents/{agent_id}")
        assert get_response.status_code == 200
        assert get_response.json()["name"] == "Test Agent"
```

### 3. End-to-End Tests

**Purpose**: Test complete user workflows

#### Standards
- Test critical user journeys
- Use production-like environment
- Include performance assertions
- Document test scenarios

#### E2E Test Example
```typescript
describe('User Registration Flow', () => {
  it('should allow new user to register and login', async () => {
    // Navigate to registration
    await page.goto('/register');

    // Fill registration form
    await page.fill('[data-testid="email"]', 'new@example.com');
    await page.fill('[data-testid="password"]', 'SecurePass123!');
    await page.click('[data-testid="submit"]');

    // Verify registration success
    await expect(page).toHaveURL('/dashboard');
    await expect(page.locator('[data-testid="welcome"]')).toBeVisible();
  });
});
```

### 4. Performance Tests

**Purpose**: Ensure system meets performance requirements

#### Standards
```yaml
performance_requirements:
  api_response_time:
    p50: 100ms
    p95: 500ms
    p99: 1000ms
  throughput:
    minimum: 1000 req/s
  resource_usage:
    memory: <512MB
    cpu: <80%
```

### 5. Security Tests

**Purpose**: Identify security vulnerabilities

#### Test Categories
- Authentication/Authorization
- Input validation
- SQL injection
- XSS prevention
- CSRF protection
- Rate limiting

## Test Documentation

### Test File Structure
```
tests/
├── unit/               # Unit tests
│   ├── services/       # Service tests
│   ├── models/         # Model tests
│   └── utils/          # Utility tests
├── integration/        # Integration tests
│   ├── api/            # API tests
│   ├── database/       # Database tests
│   └── external/       # External service tests
├── e2e/                # End-to-end tests
│   ├── flows/          # User flow tests
│   └── scenarios/      # Business scenarios
├── performance/        # Performance tests
│   ├── load/           # Load tests
│   └── stress/         # Stress tests
├── security/           # Security tests
└── fixtures/           # Test data and mocks
```

### Test Naming Conventions

#### Test File Names
- Unit tests: `[module].test.[ext]`
- Integration tests: `[feature].integration.test.[ext]`
- E2E tests: `[flow].e2e.test.[ext]`

#### Test Case Names
```
// Good
"should return user when valid ID provided"
"should throw error when user not found"
"should validate email format before saving"

// Bad
"test1"
"user test"
"it works"
```

## Coverage Requirements

### Minimum Coverage Targets

| Component Type | Unit | Integration | Overall |
|---------------|------|-------------|---------|
| Core Business Logic | 95% | 85% | 90% |
| API Endpoints | 90% | 95% | 93% |
| Utilities | 100% | N/A | 100% |
| UI Components | 85% | 70% | 80% |
| Database Layer | 80% | 90% | 85% |

### Coverage Reporting

```bash
# Rust
cargo tarpaulin --out Html --output-dir coverage

# TypeScript
npm run test:coverage

# Python
pytest --cov=src --cov-report=html
```

## Test Data Management

### Principles
- Use factories for test data creation
- Isolate test data per test
- Clean up after tests
- Use realistic data

### Test Data Factories

```rust
// Rust
#[cfg(test)]
mod factories {
    pub fn create_test_user() -> User {
        User {
            id: Uuid::new_v4(),
            name: "Test User".to_string(),
            email: "test@example.com".to_string(),
        }
    }
}
```

```typescript
// TypeScript
export class UserFactory {
  static create(overrides?: Partial<User>): User {
    return {
      id: faker.datatype.uuid(),
      name: faker.name.fullName(),
      email: faker.internet.email(),
      ...overrides,
    };
  }
}
```

## Continuous Integration

### CI Test Pipeline

```yaml
name: Test Pipeline
on: [push, pull_request]

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run unit tests
        run: |
          cargo test --lib
          npm test
      - name: Upload coverage
        uses: codecov/codecov-action@v3

  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
      redis:
        image: redis:7
    steps:
      - name: Run integration tests
        run: |
          cargo test --test '*'
          npm run test:integration

  e2e-tests:
    runs-on: ubuntu-latest
    steps:
      - name: Run E2E tests
        run: npm run test:e2e
```

## Testing Best Practices

### Do's
- ✅ Write tests first (TDD)
- ✅ Keep tests simple and focused
- ✅ Use descriptive test names
- ✅ Test behavior, not implementation
- ✅ Use appropriate assertions
- ✅ Mock external dependencies
- ✅ Run tests in CI/CD
- ✅ Maintain test documentation

### Don'ts
- ❌ Test framework/library code
- ❌ Write brittle tests
- ❌ Ignore failing tests
- ❌ Test private methods directly
- ❌ Use production data
- ❌ Share state between tests
- ❌ Skip tests without documentation

## Test Review Checklist

- [ ] Tests follow naming conventions
- [ ] Coverage meets requirements
- [ ] Tests are independent
- [ ] Edge cases are covered
- [ ] Error cases are tested
- [ ] Performance implications considered
- [ ] Documentation is updated
- [ ] CI/CD passes

## Testing Tools

### Rust
- **Framework**: Built-in `#[test]`
- **Async**: `tokio::test`
- **Mocking**: `mockall`
- **Coverage**: `tarpaulin`
- **Property**: `proptest`

### TypeScript
- **Framework**: Jest, Vitest
- **E2E**: Playwright, Cypress
- **Mocking**: Jest mocks, MSW
- **Coverage**: Jest coverage, nyc

### Python
- **Framework**: pytest
- **Async**: pytest-asyncio
- **HTTP**: httpx, pytest-httpx
- **Coverage**: pytest-cov

## Monitoring Test Health

### Metrics to Track
- Test execution time
- Flaky test frequency
- Coverage trends
- Test failure rates
- Time to fix failures

### Test Quality Gates
```yaml
quality_gates:
  coverage:
    fail_below: 70%
    warn_below: 80%
  execution_time:
    fail_above: 10m
    warn_above: 5m
  flakiness:
    fail_above: 5%
    warn_above: 2%
```

---

*These testing standards apply to all F1R3FLY.io projects. Exceptions require architectural review and documentation.*