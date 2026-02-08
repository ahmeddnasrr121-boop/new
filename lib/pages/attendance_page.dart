import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final attendance = mock.attendance();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Attendance & Time Tracking',
          actionLabel: 'New Shift',
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _metricTile('On Time', '118', Icons.timer),
                    _metricTile('Late', '6', Icons.warning_amber),
                    _metricTile('Absent', '4', Icons.person_off),
                    _metricTile('Remote', '10', Icons.location_pin),
                  ],
                ),
                const SizedBox(height: 16),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Employee')),
                    DataColumn(label: Text('Check-in')),
                    DataColumn(label: Text('Check-out')),
                    DataColumn(label: Text('Geo-location')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: attendance
                      .map(
                        (record) => DataRow(cells: [
                          DataCell(Text(record.employeeName)),
                          DataCell(Text(record.checkIn)),
                          DataCell(Text(record.checkOut)),
                          DataCell(Text(record.geoLocation)),
                          DataCell(Text(record.status)),
                        ]),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Supports manual entries, QR/barcode scanning, biometric devices, and geo-fenced check-ins.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _metricTile(String title, String value, IconData icon) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF3563E9)),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(title),
        ],
      ),
    );
  }
}
