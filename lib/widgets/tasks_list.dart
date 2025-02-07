import 'package:flutter/material.dart';
import 'package:time_tracker/models/taks.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    required this.deleteTask,
  });

  final List<Task> tasks;
  final Function(Task project) deleteTask;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            leading: Icon(Icons.task_outlined),
            title: Text(task.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => deleteTask(task),
            ),
          );
        });
  }
}
