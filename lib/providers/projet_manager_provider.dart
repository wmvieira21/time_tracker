import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/project.dart';

class ProjectManagerProvider extends ChangeNotifier {
  ProjectManagerProvider({required this.storage}) {
    _loadLocalProjects();
  }

  final List<Project> _projects = [];
  final LocalStorage storage;

  List<Project> get projects => _projects;

  void _loadLocalProjects() {
    String? tasks = localStorage.getItem('projects');
    if (tasks != null) {
      _projects.addAll((jsonDecode(tasks) as List)
          .map((jsonItem) => Project.fromJson(jsonItem))
          .toList());
    }
    notifyListeners();
  }

  void addProject(Project project) {
    _projects.add(project);
    saveData();
    notifyListeners();
  }

  void deleteProject(Project project) {
    _projects.remove(project);
    saveData();
    notifyListeners();
  }

  void saveData() {
    localStorage.setItem(
      'projects',
      jsonEncode(
        _projects.map((project) {
          return project.toJson();
        }).toList(),
      ),
    );
  }
}
