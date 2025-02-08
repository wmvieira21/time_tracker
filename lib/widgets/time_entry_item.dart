import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/utils/util.dart';

class TimeEntryItem extends StatelessWidget {
  const TimeEntryItem(
      {super.key,
      required this.entry,
      required this.projects,
      required this.tasks});

  final TimeEntry entry;
  final List<Project> projects;
  final List<Task> tasks;

  String getProjectNameById(String id) {
    Project p = projects.where((element) => element.id == id).first;
    return p.name;
  }

  String getTasktNameById(String id) {
    Task p = tasks.where((element) => element.id == id).first;
    return p.name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${getProjectNameById(entry.projectId)} - ${getTasktNameById(entry.taskId)}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Color.fromARGB(255, 2, 184, 153),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total time: ${entry.totalTime}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text('Date: ${dateFormatter.format(entry.date)}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6))),
                  Text('Note: ${entry.notes}'),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<TimeEntryProvider>(context, listen: false)
                    .deleteTimeEntry(entry);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
