class AttendanceRecord {
  const AttendanceRecord({
    required this.employeeName,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.geoLocation,
  });

  final String employeeName;
  final DateTime date;
  final String checkIn;
  final String checkOut;
  final String status;
  final String geoLocation;
}
