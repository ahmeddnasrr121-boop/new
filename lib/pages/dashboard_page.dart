import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/info_card.dart';
import '../widgets/section_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';
import 'attendance_page.dart';
import 'employees_page.dart';
import 'leave_page.dart';
import 'payroll_page.dart';
import 'reports_page.dart';
import 'tasks_assets_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _mock = const MockDataService();
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    _DashboardOverview(mock: _mock),
    EmployeesPage(mock: _mock),
    AttendancePage(mock: _mock),
    LeavePage(mock: _mock),
    PayrollPage(mock: _mock),
    TasksAssetsPage(mock: _mock),
    ReportsPage(mock: _mock),
  ];

  final List<SidebarItem> _items = const [
    SidebarItem(icon: Icons.dashboard, label: 'Dashboard'),
    SidebarItem(icon: Icons.people_alt, label: 'Employees'),
    SidebarItem(icon: Icons.access_time_filled, label: 'Attendance'),
    SidebarItem(icon: Icons.event_available, label: 'Leave Requests'),
    SidebarItem(icon: Icons.payments, label: 'Payroll'),
    SidebarItem(icon: Icons.assignment_turned_in, label: 'Tasks & Assets'),
    SidebarItem(icon: Icons.insert_chart, label: 'Reports'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 1100;

        return Scaffold(
          drawer: isNarrow
              ? Drawer(
                  child: HrSidebar(
                    items: _items,
                    selectedIndex: _selectedIndex,
                    onSelect: (index) {
                      setState(() => _selectedIndex = index);
                      Navigator.pop(context);
                    },
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isNarrow)
                HrSidebar(
                  items: _items,
                  selectedIndex: _selectedIndex,
                  onSelect: (index) => setState(() => _selectedIndex = index),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      if (isNarrow)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                      const HrTopBar(),
                      const SizedBox(height: 24),
                      Expanded(
                        child: SingleChildScrollView(
                          child: _pages[_selectedIndex],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardOverview extends StatelessWidget {
  const _DashboardOverview({required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final employees = mock.employees();
    final attendance = mock.attendance();
    final leaves = mock.leaves();
    final payroll = mock.payroll();
    final tasks = mock.tasks();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const [
            InfoCard(
              title: 'Total Employees',
              value: '148',
              subtitle: '+4 new hires this month',
              icon: Icons.people_alt,
              iconColor: Color(0xFF3563E9),
            ),
            InfoCard(
              title: 'Today Attendance',
              value: '132 Present',
              subtitle: '6 late · 10 remote',
              icon: Icons.access_time_filled,
              iconColor: Color(0xFF00B383),
            ),
            InfoCard(
              title: 'Open Leaves',
              value: '18 Requests',
              subtitle: '9 pending approval',
              icon: Icons.event_available,
              iconColor: Color(0xFFF5A623),
            ),
            InfoCard(
              title: 'Payroll Status',
              value: 'September',
              subtitle: '82% processed',
              icon: Icons.payments,
              iconColor: Color(0xFF9B51E0),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const SectionHeader(title: 'Live Operations Overview'),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Attendance Snapshot',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      ...attendance.map(
                        (record) => ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(record.employeeName),
                          subtitle: Text(
                              '${record.checkIn} → ${record.checkOut} · ${record.geoLocation}'),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: record.status == 'On Time'
                                  ? const Color(0xFFE6F7F1)
                                  : const Color(0xFFFFF2E5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              record.status,
                              style: TextStyle(
                                color: record.status == 'On Time'
                                    ? const Color(0xFF00B383)
                                    : const Color(0xFFF2994A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pending Approvals',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          ...leaves.map(
                            (leave) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(leave.employeeName),
                              subtitle: Text(
                                  '${leave.leaveType} · ${leave.from.month}/${leave.from.day} - ${leave.to.month}/${leave.to.day}'),
                              trailing: Text(
                                leave.status,
                                style: const TextStyle(
                                    color: Color(0xFFF2994A),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
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
                            'Payroll Highlights',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          ...payroll.map(
                            (entry) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(entry.employeeName),
                              subtitle:
                                  Text('Net salary: ${entry.netSalary} EGP'),
                              trailing: Text(
                                entry.status,
                                style: const TextStyle(
                                    color: Color(0xFF3563E9),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tasks in Progress',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      ...tasks.map(
                        (task) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(task.title),
                          subtitle: Text('Assigned to ${task.assignee}'),
                          trailing: SizedBox(
                            width: 120,
                            child: LinearProgressIndicator(
                              value: task.progress,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(12),
                              backgroundColor: const Color(0xFFE8ECF5),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _quickAction(
                            context,
                            icon: Icons.person_add,
                            label: 'Add Employee',
                          ),
                          _quickAction(
                            context,
                            icon: Icons.fingerprint,
                            label: 'Capture Attendance',
                          ),
                          _quickAction(
                            context,
                            icon: Icons.receipt_long,
                            label: 'Run Payroll',
                          ),
                          _quickAction(
                            context,
                            icon: Icons.insert_chart,
                            label: 'Generate Report',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const SectionHeader(title: 'Employee Directory Overview'),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: employees
                  .map(
                    (employee) => ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(employee.fullName),
                      subtitle:
                          Text('${employee.jobTitle} · ${employee.department}'),
                      trailing: Text(
                        employee.status,
                        style: TextStyle(
                          color: employee.status == 'Active'
                              ? const Color(0xFF00B383)
                              : const Color(0xFFF2994A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quickAction(BuildContext context,
      {required IconData icon, required String label}) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
