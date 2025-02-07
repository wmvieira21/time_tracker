import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/widgets/time_entry_item.dart';

class TimeEntryList extends StatelessWidget {
  const TimeEntryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<TimeEntry> entries =
        Provider.of<TimeEntryProvider>(context, listen: false).entries;

    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ...entries.map(
              (entry) => TimeEntryItem(timeEntry: entry),
            ),
          ],
        );
      },
    );
  }
}
