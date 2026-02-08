import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final notifications = mock.notifications();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Reports & Analytics',
          actionLabel: 'Export Report',
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
                    _reportChip('Attendance Report', Icons.schedule),
                    _reportChip('Payroll Summary', Icons.payments),
                    _reportChip('Leave Balance', Icons.event_available),
                    _reportChip('Department KPIs', Icons.business),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Scheduled reports can be auto-exported to Excel/PDF and delivered via email.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications & Alerts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                ...notifications.map(
                  (note) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(note.title),
                    subtitle: Text(note.message),
                    trailing: Text(note.time),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _reportChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF3563E9)),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
