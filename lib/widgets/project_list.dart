import 'package:flutter/material.dart';
import 'package:time_tracker/models/project.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.projects,
    required this.deleteProject,
  });

  final List<Project> projects;
  final Function(Project project) deleteProject;

  @override
  Widget build(Object context) {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          Project project = projects[index];
          return ListTile(
            leading: Icon(Icons.folder_open),
            title: Text(project.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => deleteProject(project),
            ),
          );
        });
  }
}
