import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final leaves = mock.leaves();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Leave Management',
          actionLabel: 'New Leave Policy',
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Leave balances are tracked per employee and approvals are routed to managers with notifications.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Employee')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('From')),
                    DataColumn(label: Text('To')),
                    DataColumn(label: Text('Balance')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: leaves
                      .map(
                        (leave) => DataRow(cells: [
                          DataCell(Text(leave.employeeName)),
                          DataCell(Text(leave.leaveType)),
                          DataCell(Text('${leave.from.month}/${leave.from.day}')),
                          DataCell(Text('${leave.to.month}/${leave.to.day}')),
                          DataCell(Text('${leave.remainingBalance} days')),
                          DataCell(Text(leave.status)),
                        ]),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Example action: approve or reject leave and trigger employee notifications automatically.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
