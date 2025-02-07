import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/project.dart';

class ProjectManagerSreeen extends StatefulWidget {
  const ProjectManagerSreeen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProjectManagerSreeen();
  }
}

class _ProjectManagerSreeen extends State<ProjectManagerSreeen> {
  @override
  Widget build(BuildContext context) {
    List<Project> projects = [Project(name: 'Project beta')];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manage Projects"),
      ),
      body: Consumer(builder: (context, value, child) {
        return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              Project project = projects[index];
              return ListTile(
                leading: Icon(Icons.category_rounded),
                title: Text(project.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {},
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        tooltip: 'Add new project',
        onPressed: () => {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
