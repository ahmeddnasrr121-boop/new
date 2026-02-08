class LeaveRequest {
  const LeaveRequest({
    required this.employeeName,
    required this.leaveType,
    required this.from,
    required this.to,
    required this.status,
    required this.remainingBalance,
  });

  final String employeeName;
  final String leaveType;
  final DateTime from;
  final DateTime to;
  final String status;
  final int remainingBalance;
}
