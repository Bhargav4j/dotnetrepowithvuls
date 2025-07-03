# Vulnerable .NET API Project

⚠️ **WARNING: This project contains intentional security vulnerabilities for educational purposes only. DO NOT use in production!**

## Project Overview

This is a deliberately vulnerable .NET 8 Web API project designed for security testing, vulnerability scanning, and educational purposes. The project contains multiple common security vulnerabilities that should be identified and fixed.

## Vulnerabilities Included

### 1. Authentication & Authorization
- **Hardcoded JWT secrets** in code and configuration files
- **Weak JWT configuration** (no issuer/audience validation, no lifetime validation)
- **Hardcoded admin credentials** in code
- **Missing authentication checks** on sensitive endpoints
- **Simple string comparison** for password validation

### 2. SQL Injection
- **Direct string concatenation** in SQL queries
- **No parameterized queries** used
- **User input directly embedded** in SQL statements
- **SQL execution endpoint** without validation

### 3. Cross-Site Scripting (XSS)
- **Unsanitized user input** stored and returned
- **No input validation** on comment fields
- **Direct HTML rendering** of user content

### 4. File Upload Vulnerabilities
- **Path traversal** vulnerabilities in file operations
- **No file type validation**
- **No file size limits**
- **Unsafe file extensions** allowed (.exe, .bat, .cmd)

### 5. Information Disclosure
- **Detailed error messages** exposed to users
- **Sensitive data** in API responses (passwords, SSN, credit cards)
- **System information** exposed
- **Environment variables** leaked

### 6. Weak Cryptography
- **MD5 hashing** for passwords
- **DES encryption** with ECB mode
- **Weak encryption keys**
- **Poor random number generation**

### 7. Insecure Deserialization
- **TypeNameHandling.All** in JSON.NET
- **Unsafe deserialization** settings

### 8. Command Injection
- **Direct command execution** from user input
- **No input validation** on command parameters

### 9. CORS Misconfiguration
- **Wildcard CORS policy** allowing all origins
- **Overly permissive** CORS settings

### 10. Configuration Issues
- **Hardcoded connection strings** with credentials
- **Sensitive data** in configuration files
- **Debug information** exposed in production

## Project Structure

```
VulnerableApi/
├── Controllers/
│   ├── UserController.cs      # SQL injection, XSS, weak auth
│   ├── FileController.cs      # Path traversal, file upload vulns
│   └── AdminController.cs     # Auth bypass, privilege escalation
├── Services/
│   └── InsecureService.cs     # Weak crypto, insecure serialization
├── Models/
│   └── User.cs               # Sensitive data exposure
├── Program.cs                # Weak JWT config, CORS issues
├── appsettings.json          # Hardcoded secrets
└── appsettings.Development.json # Debug info exposure
```

## Vulnerable Endpoints

### User Controller
- `GET /api/user/search?query=...` - SQL injection
- `POST /api/user/login` - SQL injection, weak auth
- `POST /api/user/comment` - XSS, SQL injection
- `GET /api/user/profile/{id}` - SQL injection, info disclosure

### File Controller
- `POST /api/file/upload` - Path traversal, unsafe file upload
- `GET /api/file/download?fileName=...` - Path traversal
- `GET /api/file/read?filePath=...` - Path traversal
- `POST /api/file/execute` - Command injection

### Admin Controller
- `POST /api/admin/login` - Hardcoded credentials
- `GET /api/admin/users` - No auth, info disclosure
- `POST /api/admin/delete-user` - No auth, SQL injection
- `POST /api/admin/promote-user` - No auth, SQL injection
- `GET /api/admin/system-info` - No auth, info disclosure
- `POST /api/admin/execute-sql` - No auth, SQL injection

## Running the Project

1. Ensure you have .NET 8 SDK installed
2. Navigate to the project directory
3. Run: `dotnet restore`
4. Run: `dotnet run`

The API will be available at `https://localhost:7001` and `http://localhost:5001`

## Security Testing

This project is designed to be tested with various security tools:

- **SAST tools**: SonarQube, CodeQL, Semgrep
- **DAST tools**: OWASP ZAP, Burp Suite
- **Dependency scanners**: Snyk, OWASP Dependency Check
- **Container scanners**: Trivy, Snyk Container

## Educational Use

This project demonstrates common security mistakes and should be used for:

- Learning about web application security
- Testing security scanning tools
- Practicing vulnerability assessment
- Understanding secure coding practices

## Disclaimer

This project is for educational purposes only. The vulnerabilities are intentionally included and should not be used in any production environment. Use at your own risk and only in controlled, isolated environments. 