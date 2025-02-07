import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/dialogs/add_item_dialog.dart';
import 'package:time_tracker/models/taks.dart';
import 'package:time_tracker/providers/task_manager_provider.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TaskManagerScreen();
  }
}

class _TaskManagerScreen extends State<TaskManagerScreen> {
  _showAddItemDialog() {
    showDialog(
        context: context,
        builder: (context) => AddItemDialog(tittle: 'Task')).then((value) {
      if (value != null) {
        Task task = Task(name: value);
        Provider.of<TaskManagerProvider>(context, listen: false).addTask(task);
      }
    });
  }

  _deleteItem(Task task) {
    Provider.of<TaskManagerProvider>(context, listen: false).deleteTask(task);
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList =
        Provider.of<TaskManagerProvider>(context, listen: true).tasks;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manage Tasks"),
      ),
      body: Consumer(builder: (context, value, child) {
        return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              Task task = tasksList[index];
              return ListTile(
                leading: Icon(Icons.tag),
                title: Text(task.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => _deleteItem(task),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new Taks',
        backgroundColor: Colors.amber,
        onPressed: () => _showAddItemDialog(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
