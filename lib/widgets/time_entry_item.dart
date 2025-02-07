import 'package:flutter/material.dart';
import 'package:time_tracker/models/time_entry.dart';

class TimeEntryItem extends StatelessWidget {
  const TimeEntryItem({super.key, required this.timeEntry});

  final TimeEntry timeEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('${timeEntry.projectId} - ${timeEntry.date}'),
                  Text('data'),
                  Text('data'),
                ],
              ),
            ),
            IconButton(
              onPressed: () => '',
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
