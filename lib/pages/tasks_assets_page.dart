import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/section_header.dart';

class TasksAssetsPage extends StatelessWidget {
  const TasksAssetsPage({super.key, required this.mock});

  final MockDataService mock;

  @override
  Widget build(BuildContext context) {
    final tasks = mock.tasks();
    final assets = mock.assets();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Tasks & Assets',
          actionLabel: 'Assign Task',
        ),
        const SizedBox(height: 12),
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
                        'Tasks Tracking',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      ...tasks.map(
                        (task) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(task.title),
                          subtitle: Text(
                              'Assignee: ${task.assignee} · Due ${task.dueDate.month}/${task.dueDate.day}'),
                          trailing: Text('${(task.progress * 100).toInt()}%'),
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
                        'Assets Inventory',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      ...assets.map(
                        (asset) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(asset.assetName),
                          subtitle:
                              Text('Serial: ${asset.serial} · ${asset.status}'),
                          trailing: Text(asset.assignedTo),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Track employee assets (laptops, mobiles, IDs) and task progress with clear ownership.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
