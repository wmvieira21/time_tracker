import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/widgets/no_data_found.dart';
import 'package:time_tracker/widgets/time_entry_item.dart';

class TimeEntryList extends StatefulWidget {
  const TimeEntryList({super.key});

  @override
  State<TimeEntryList> createState() => _TimeEntryListState();
}

class _TimeEntryListState extends State<TimeEntryList> {
  @override
  Widget build(BuildContext context) {
    List<TimeEntry> entries =
        Provider.of<TimeEntryProvider>(context, listen: true).entries;
    List<Project> projects =
        Provider.of<ProjectManagerProvider>(context, listen: false).projects;
    List<Task> tasks =
        Provider.of<TaskManagerProvider>(context, listen: false).tasks;

    if (entries.isEmpty) {
      return NoDataFound(
        icon: Icons.hourglass_empty,
        typeOfData: 'time entries',
      );
    }
    return Consumer(builder: (context, value, child) {
      return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return TimeEntryItem(
              entry: entries[index], projects: projects, tasks: tasks);
        },
      );
    });
  }
}
