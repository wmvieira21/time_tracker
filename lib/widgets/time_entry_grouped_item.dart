import 'package:flutter/material.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/utils/util.dart';

class TimeEntryGroupedItem extends StatelessWidget {
  const TimeEntryGroupedItem(
      {super.key,
      required this.entryKey,
      required this.entryValues,
      required this.projects,
      required this.tasks});

  final String entryKey;
  final List<TimeEntry> entryValues;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getProjectNameById(entryKey),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Color.fromARGB(255, 2, 184, 153),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                ...entryValues.map(
                  (entries) => Text(
                      '- ${getTasktNameById(entries.taskId)}: ${entries.totalTime} hours (${dateFormatter.format(entries.date)})',
                      style: Theme.of(context).textTheme.bodyMedium),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
