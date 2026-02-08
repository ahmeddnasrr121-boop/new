import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final employees = mock.employees();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Employees Management',
          actionLabel: 'Add Employee',
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
                    _infoChip('Active', '132'),
                    _infoChip('On Leave', '8'),
                    _infoChip('Probation', '5'),
                    _infoChip('Remote', '28'),
                  ],
                ),
                const SizedBox(height: 16),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Employee')),
                    DataColumn(label: Text('Department')),
                    DataColumn(label: Text('Role')),
                    DataColumn(label: Text('Location')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: employees
                      .map(
                        (employee) => DataRow(cells: [
                          DataCell(Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(employee.fullName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              Text(employee.email,
                                  style: const TextStyle(color: Colors.black54)),
                            ],
                          )),
                          DataCell(Text(employee.department)),
                          DataCell(Text(employee.jobTitle)),
                          DataCell(Text(employee.location)),
                          DataCell(Text(employee.status)),
                        ]),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Example actions: create employee profiles, upload contracts, and assign login credentials with role-based access.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
