class Employee {
  const Employee({
    required this.id,
    required this.fullName,
    required this.nationalId,
    required this.role,
    required this.department,
    required this.jobTitle,
    required this.joinDate,
    required this.phone,
    required this.email,
    required this.location,
    required this.status,
  });

  final String id;
  final String fullName;
  final String nationalId;
  final String role;
  final String department;
  final String jobTitle;
  final DateTime joinDate;
  final String phone;
  final String email;
  final String location;
  final String status;
}
