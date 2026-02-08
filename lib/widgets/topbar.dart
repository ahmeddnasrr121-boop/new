import 'package:flutter/material.dart';

class HrTopBar extends StatelessWidget {
  const HrTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'HR Management Dashboard',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Manage people, payroll, and performance in one place.'),
            ],
          ),
        ),
        SizedBox(
          width: 280,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search employees, requests, tasks',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(width: 16),
        CircleAvatar(
          radius: 22,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Text('HR', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
