import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final payroll = mock.payroll();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Payroll Management',
          actionLabel: 'Close Payroll',
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
                    _metricTile('Monthly Payroll', '2.4M EGP'),
                    _metricTile('Bonuses', '120K EGP'),
                    _metricTile('Deductions', '48K EGP'),
                    _metricTile('Transfers', '98 Pending'),
                  ],
                ),
                const SizedBox(height: 16),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Employee')),
                    DataColumn(label: Text('Base Salary')),
                    DataColumn(label: Text('Bonus')),
                    DataColumn(label: Text('Deductions')),
                    DataColumn(label: Text('Net Salary')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: payroll
                      .map(
                        (entry) => DataRow(cells: [
                          DataCell(Text(entry.employeeName)),
                          DataCell(Text('${entry.baseSalary} EGP')),
                          DataCell(Text('${entry.bonus} EGP')),
                          DataCell(Text('${entry.deductions} EGP')),
                          DataCell(Text('${entry.netSalary} EGP')),
                          DataCell(Text(entry.status)),
                        ]),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Exports supported: PDF payslips, bank transfer files, and payroll journal entries.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _metricTile(String label, String value) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}
