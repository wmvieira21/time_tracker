import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/dialogs/add_item_dialog.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';

class ProjectManagerSreeen extends StatefulWidget {
  const ProjectManagerSreeen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProjectManagerSreeen();
  }
}

class _ProjectManagerSreeen extends State<ProjectManagerSreeen> {
  _showAddProjectDialog() {
    showDialog(
        context: context,
        builder: (context) => AddItemDialog(tittle: 'Project')).then((value) {
      if (value != null) {
        Project project = Project(name: value);
        Provider.of<ProjectManagerProvider>(context, listen: false)
            .addProject(project);
      }
    });
  }

  _deleteProject(Project project) {
    Provider.of<ProjectManagerProvider>(context, listen: false)
        .deleteProject(project);
  }

  @override
  Widget build(BuildContext context) {
    List<Project> projects =
        Provider.of<ProjectManagerProvider>(context, listen: true).projects;

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
                  onPressed: () => _deleteProject(project),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        tooltip: 'Add new project',
        onPressed: () => _showAddProjectDialog(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
