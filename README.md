# HR Management System (Flutter Web/Desktop)

Modern, full-featured **HR Management System** built with Flutter for Web/Desktop. The UI matches a modern dashboard aesthetic and provides modular sections for employees, attendance, leave, payroll, tasks/assets, and reports.

## ✨ Features

### Employees Management
- Add/edit/delete employees with profile data (name, national ID, role, department, job title, join date, phone, email, location).
- Upload contracts, certificates, CVs, and supporting documents.
- Employee status tracking and directory view.

### Users & Permissions
- Dedicated user accounts per employee (username/password).
- Role-based access control (Admin, HR Manager, Employee).
- Employee self-service portal (attendance, leave, payroll, documents).

### Attendance & Time Tracking
- Manual check-in/out with geo-location.
- Support for QR/Barcode/Biometric integrations.
- Shift management with daily/weekly/monthly reporting.

### Leave Management
- Leave requests and approvals workflow.
- Leave types (Annual, Sick, Casual, etc.).
- Leave balance tracking per employee.

### Payroll Management
- Monthly payroll cycle closing.
- Bonuses/deductions support.
- Auto-salary calculations based on attendance/leave.
- Export payslips (PDF) and bank transfer files.

### Tasks & Assets
- Assign tasks to employees and track completion.
- Track company assets (laptops, phones, badges, etc.).

### Reports & Analytics
- Dashboard KPIs: employee count, attendance, lateness, open leaves.
- Department-level reports and analytics.
- Export reports to Excel/PDF.

### Notifications & Alerts
- Alerts for approvals, leave status, contract expirations.
- Admin notifications for critical events.

### Security
- Password encryption, role-based permissions.
- Automated backups (policy ready).
- Protection against unauthorized access.

## 🧱 Modular Structure
```
lib/
  app.dart
  main.dart
  models/              # Employees, attendance, leave, payroll, assets
  pages/               # UI pages for each module
  services/            # Mock data / API service layer
  widgets/             # Reusable UI widgets
  theme/               # Theme configuration
```

## ✅ Example Workflows
- **Add Employee** → Employees page → "Add Employee" button.
- **Record Attendance** → Attendance page → new shift / capture attendance.
- **Request Leave** → Leave Management page → submission + approval routing.
- **Run Payroll** → Payroll Management page → close payroll + export.

## 🚀 Getting Started

### 1) Install dependencies
```bash
flutter pub get
```

### 2) Run locally (web)
```bash
flutter run -d chrome
```

### 3) Run locally (desktop)
```bash
flutter run -d windows
```

## 🗄️ Database Schema (Suggested for Backend)
Suggested tables:
- Employees
- Users
- Attendance
- Leaves
- Payroll
- Tasks
- Assets
- Reports
- Permissions

## 🔌 Backend Integration Notes
The frontend is ready to connect with any backend (Django/Flask/FastAPI, Node, etc.). Recommended endpoints:
- `/api/employees` (CRUD)
- `/api/attendance` (check-in/out, reports)
- `/api/leaves` (request/approve)
- `/api/payroll` (calculate/export)
- `/api/tasks` (assign/status)
- `/api/assets` (track)
- `/api/reports` (export)

## 📌 Notes
This repository focuses on **UI/UX** and **system structure**. Backend integration is designed to be plugged in via the `services/` layer.
