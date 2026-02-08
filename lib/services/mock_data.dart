import '../models/asset.dart';
import '../models/attendance.dart';
import '../models/employee.dart';
import '../models/hr_notification.dart';
import '../models/leave_request.dart';
import '../models/payroll_entry.dart';
import '../models/task_item.dart';

class MockDataService {
  const MockDataService();

  List<Employee> employees() => [
        Employee(
          id: 'EMP-1001',
          fullName: 'Mariam Al-Sayed',
          nationalId: '29809120012345',
          role: 'HR Manager',
          department: 'Human Resources',
          jobTitle: 'Senior HR Manager',
          joinDate: DateTime(2021, 5, 14),
          phone: '+20 100 123 4567',
          email: 'mariam.hr@company.com',
          location: 'Cairo HQ',
          status: 'Active',
        ),
        Employee(
          id: 'EMP-1002',
          fullName: 'Omar Hassan',
          nationalId: '29703150078965',
          role: 'Employee',
          department: 'Engineering',
          jobTitle: 'Mobile Developer',
          joinDate: DateTime(2022, 2, 2),
          phone: '+20 111 234 8989',
          email: 'omar.dev@company.com',
          location: 'Alexandria Hub',
          status: 'Active',
        ),
        Employee(
          id: 'EMP-1003',
          fullName: 'Nour Ibrahim',
          nationalId: '29612290056789',
          role: 'Payroll Admin',
          department: 'Finance',
          jobTitle: 'Payroll Specialist',
          joinDate: DateTime(2020, 11, 11),
          phone: '+20 122 567 8800',
          email: 'nour.payroll@company.com',
          location: 'Remote - Giza',
          status: 'On Leave',
        ),
      ];

  List<AttendanceRecord> attendance() => [
        AttendanceRecord(
          employeeName: 'Mariam Al-Sayed',
          date: DateTime.now(),
          checkIn: '08:45 AM',
          checkOut: '05:30 PM',
          status: 'On Time',
          geoLocation: '30.0444°N, 31.2357°E',
        ),
        AttendanceRecord(
          employeeName: 'Omar Hassan',
          date: DateTime.now(),
          checkIn: '09:10 AM',
          checkOut: '05:00 PM',
          status: 'Late',
          geoLocation: '31.2001°N, 29.9187°E',
        ),
      ];

  List<LeaveRequest> leaves() => [
        LeaveRequest(
          employeeName: 'Nour Ibrahim',
          leaveType: 'Annual Leave',
          from: DateTime(2025, 10, 2),
          to: DateTime(2025, 10, 7),
          status: 'Pending Approval',
          remainingBalance: 8,
        ),
        LeaveRequest(
          employeeName: 'Omar Hassan',
          leaveType: 'Sick Leave',
          from: DateTime(2025, 9, 18),
          to: DateTime(2025, 9, 19),
          status: 'Approved',
          remainingBalance: 12,
        ),
      ];

  List<PayrollEntry> payroll() => [
        PayrollEntry(
          employeeName: 'Mariam Al-Sayed',
          baseSalary: 18000,
          bonus: 2000,
          deductions: 500,
          netSalary: 19500,
          status: 'Ready for Transfer',
        ),
        PayrollEntry(
          employeeName: 'Omar Hassan',
          baseSalary: 14000,
          bonus: 1000,
          deductions: 700,
          netSalary: 14300,
          status: 'Draft',
        ),
      ];

  List<TaskItem> tasks() => [
        TaskItem(
          title: 'Update onboarding handbook',
          assignee: 'Mariam Al-Sayed',
          dueDate: DateTime(2025, 10, 4),
          progress: 0.72,
        ),
        TaskItem(
          title: 'Complete payroll automation tests',
          assignee: 'Nour Ibrahim',
          dueDate: DateTime(2025, 10, 7),
          progress: 0.45,
        ),
      ];

  List<AssetItem> assets() => [
        AssetItem(
          assetName: 'MacBook Pro 16"',
          serial: 'AP-9941-22',
          assignedTo: 'Omar Hassan',
          status: 'In Use',
        ),
        AssetItem(
          assetName: 'Lenovo ThinkPad T14',
          serial: 'LP-2044-11',
          assignedTo: 'Nour Ibrahim',
          status: 'Under Maintenance',
        ),
      ];

  List<HrNotification> notifications() => [
        HrNotification(
          title: 'Leave Request',
          message: 'Nour Ibrahim submitted an annual leave request.',
          time: '10 mins ago',
          category: 'Approvals',
        ),
        HrNotification(
          title: 'Contract Expiry',
          message: 'Omar Hassan contract expires in 30 days.',
          time: '2 hours ago',
          category: 'Alerts',
        ),
        HrNotification(
          title: 'Payroll Ready',
          message: 'September payroll is ready for export to the bank.',
          time: 'Yesterday',
          category: 'Payroll',
        ),
      ];
}
