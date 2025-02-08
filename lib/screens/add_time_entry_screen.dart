import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';
import 'package:time_tracker/utils/util.dart';
import 'package:time_tracker/widgets/add_entry_dropdown.dart';

class AddTimeEntryScreen extends StatefulWidget {
  const AddTimeEntryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddTimeEntryScreen();
  }
}

class _AddTimeEntryScreen extends State<AddTimeEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String projectId = '';
  String taskId = '';
  DateTime date = DateTime.now();
  TextEditingController totalTimeAmountController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  _saveEntry() {
    TimeEntry timeEntry = TimeEntry(
      projectId: projectId,
      taskId: taskId,
      totalTime: double.parse(totalTimeAmountController.text),
      date: date,
      notes: notesController.text,
    );

    Provider.of<TimeEntryProvider>(context, listen: false)
        .addTimeEntry(timeEntry);
    Navigator.pop(context);
  }

  void _showDateTimePicker() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime.now().subtract(Duration(days: 365));

    DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    if (selectedDate != null) {
      setState(() {
        date = selectedDate;
      });
    }
  }

  @override
  void dispose() {
    totalTimeAmountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Project> projects =
        Provider.of<ProjectManagerProvider>(context, listen: false).projects;
    List<Task> tasks =
        Provider.of<TaskManagerProvider>(context, listen: false).tasks;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Time Entry'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: <Widget>[
                TimeEntryDropdown(
                  items: projects,
                  label: 'Project',
                  onChange: (value) => projectId = value,
                ),
                TimeEntryDropdown(
                  items: tasks,
                  label: 'Task',
                  onChange: (value) => taskId = value,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text('Date: ${dateFormatterAddScreen.format(date)}'),
                      OutlinedButton(
                          onPressed: () => _showDateTimePicker(),
                          child: const Text('Select date'))
                    ],
                  ),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Total Time (in hours)'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: totalTimeAmountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total time';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Note'),
                    maxLength: 50,
                    controller: notesController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some notes';
                      }
                      return null;
                    }),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveEntry();
                    }
                  },
                  child: const Text('Save entry'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
