class PayrollEntry {
  const PayrollEntry({
    required this.employeeName,
    required this.baseSalary,
    required this.bonus,
    required this.deductions,
    required this.netSalary,
    required this.status,
  });

  final String employeeName;
  final double baseSalary;
  final double bonus;
  final double deductions;
  final double netSalary;
  final String status;
}
