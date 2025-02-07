import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/dialogs/add_item_dialog.dart';
import 'package:time_tracker/models/project.dart';
import 'package:time_tracker/providers/projet_manager_provider.dart';
import 'package:time_tracker/widgets/no_data_found.dart';
import 'package:time_tracker/widgets/project_list.dart';

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

    Widget mainContent = projects.isNotEmpty
        ? ProjectList(projects: projects, deleteProject: _deleteProject)
        : NoDataFound(icon: Icons.folder_open, typeOfData: 'projects');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Manage Projects"),
      ),
      body: Consumer(builder: (context, value, child) {
        return mainContent;
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
