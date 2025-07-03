# Vulnerabilities Summary

This document provides a detailed breakdown of all security vulnerabilities intentionally included in this .NET project for educational purposes.

## 🔴 Critical Vulnerabilities

### 1. SQL Injection (Multiple instances)
**Location**: `Controllers/UserController.cs`, `Controllers/AdminController.cs`
- **Lines**: 18, 35, 52, 67 in UserController
- **Lines**: 25, 42, 55, 68 in AdminController
- **Description**: Direct string concatenation in SQL queries
- **Example**: `var sql = $"SELECT * FROM Users WHERE Name LIKE '%{query}%'";`

### 2. Hardcoded Secrets
**Location**: `Program.cs`, `appsettings.json`, `appsettings.Development.json`
- **JWT Secret**: `"super-secret-key-that-should-never-be-in-code-12345"`
- **Database Password**: `"Password123!"`
- **Admin Credentials**: `admin/admin123`

### 3. Command Injection
**Location**: `Controllers/FileController.cs` line 58
- **Description**: Direct command execution from user input
- **Example**: `process.StartInfo.Arguments = $"/c {command}";`

### 4. Path Traversal
**Location**: `Controllers/FileController.cs` lines 20, 35, 45
- **Description**: No validation of file paths allowing directory traversal
- **Example**: `var filePath = Path.Combine(_uploadPath, fileName);`

## 🟠 High Vulnerabilities

### 5. Weak Authentication
**Location**: `Program.cs` lines 8-25
- **Issues**: No issuer/audience validation, no lifetime validation
- **Example**: `ValidateIssuer = false, ValidateAudience = false, ValidateLifetime = false`

### 6. Insecure File Upload
**Location**: `Controllers/FileController.cs` lines 15-30
- **Issues**: No file type validation, allows executable files
- **Allowed Extensions**: `.exe`, `.bat`, `.cmd`

### 7. Information Disclosure
**Location**: Multiple files
- **Passwords in responses**: `Controllers/UserController.cs` line 75
- **System information**: `Controllers/AdminController.cs` lines 80-90
- **Detailed errors**: `Controllers/AdminController.cs` line 105

### 8. Cross-Site Scripting (XSS)
**Location**: `Controllers/UserController.cs` line 50
- **Description**: Unsanitized user input stored and returned
- **Example**: Storing comments without HTML encoding

## 🟡 Medium Vulnerabilities

### 9. Weak Cryptography
**Location**: `Services/InsecureService.cs`
- **MD5 Hashing**: Lines 35-40
- **DES Encryption**: Lines 12-30
- **Weak Random**: Lines 70-80

### 10. Insecure Deserialization
**Location**: `Services/InsecureService.cs` lines 45-55
- **Issue**: `TypeNameHandling.All` allows type injection
- **Example**: `TypeNameHandling = TypeNameHandling.All`

### 11. CORS Misconfiguration
**Location**: `Program.cs` lines 30-35
- **Issue**: Wildcard CORS policy
- **Example**: `policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()`

### 12. Missing Authentication
**Location**: `Controllers/AdminController.cs`
- **Issues**: No auth checks on sensitive endpoints
- **Endpoints**: `/api/admin/users`, `/api/admin/system-info`

## 🟢 Low Vulnerabilities

### 13. Weak Password Requirements
**Location**: `Models/User.cs` line 40
- **Issue**: Minimum length of 1 character
- **Example**: `[MinLength(1)]`

### 14. Debug Information in Production
**Location**: `appsettings.Development.json`
- **Issues**: Detailed errors, sensitive data logging
- **Example**: `"LogPasswords": true, "LogConnectionStrings": true`

### 15. Outdated Dependencies
**Location**: `VulnerableApi.csproj`
- **Issues**: Using older package versions
- **Examples**: `log4net` 2.0.15, `Castle.Windsor` 5.1.1

## 📁 Project Structure

```
dotnetrepowithvuls/
├── Directory.Build.props           # Global build properties
├── VulnerableApi.sln               # Solution file
├── README.md                       # Project documentation
├── VULNERABILITIES_SUMMARY.md      # This file
├── .gitignore                      # Git ignore rules
└── VulnerableApi/                  # Main project
    ├── VulnerableApi.csproj        # Project file with vulnerable packages
    ├── Program.cs                  # Weak JWT config, CORS issues
    ├── appsettings.json            # Hardcoded secrets
    ├── appsettings.Development.json # Debug info exposure
    ├── Controllers/
    │   ├── UserController.cs       # SQL injection, XSS, weak auth
    │   ├── FileController.cs       # Path traversal, command injection
    │   └── AdminController.cs      # Auth bypass, privilege escalation
    ├── Services/
    │   └── InsecureService.cs      # Weak crypto, insecure serialization
    └── Models/
        └── User.cs                 # Sensitive data exposure
```

## 🎯 Testing Endpoints

### SQL Injection Tests
- `GET /api/user/search?query=' OR 1=1--`
- `POST /api/user/login` with `{"username":"' OR 1=1--","password":"test"}`

### XSS Tests
- `POST /api/user/comment` with `{"userId":1,"comment":"<script>alert('XSS')</script>"}`

### Path Traversal Tests
- `GET /api/file/read?filePath=../../../windows/win.ini`

### Command Injection Tests
- `POST /api/file/execute` with `{"command":"dir"}`

### Authentication Bypass
- `GET /api/admin/users` (no auth required)
- `GET /api/admin/system-info` (no auth required)

## ⚠️ Security Tools Detection

This project should be detected by:
- **SAST**: SonarQube, CodeQL, Semgrep, Snyk Code
- **DAST**: OWASP ZAP, Burp Suite, Acunetix
- **Dependency Scanners**: Snyk, OWASP Dependency Check
- **Container Scanners**: Trivy, Snyk Container

## 🔧 Remediation Notes

Each vulnerability includes comments indicating the issue and should be fixed by:
1. Using parameterized queries for SQL
2. Implementing proper authentication/authorization
3. Validating and sanitizing all inputs
4. Using secure cryptographic algorithms
5. Removing hardcoded secrets
6. Implementing proper CORS policies
7. Updating vulnerable dependencies 