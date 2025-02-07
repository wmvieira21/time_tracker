import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/taks.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TagbsScreen();
  }
}

class _TagbsScreen extends State<TaskManagerScreen> {
  @override
  Widget build(BuildContext context) {
    List<Task> tagList = [];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manage Tasks"),
      ),
      body: Consumer(builder: (context, value, child) {
        return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: tagList.length,
            itemBuilder: (context, index) {
              Task taks = tagList[index];
              return ListTile(
                leading: Icon(Icons.tag),
                title: Text(taks.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {},
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new Taks',
        backgroundColor: Colors.amber,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
