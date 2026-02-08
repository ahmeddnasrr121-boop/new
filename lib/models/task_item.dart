class TaskItem {
  const TaskItem({
    required this.title,
    required this.assignee,
    required this.dueDate,
    required this.progress,
  });

  final String title;
  final String assignee;
  final DateTime dueDate;
  final double progress;
}
