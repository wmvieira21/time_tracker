import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/taks.dart';

class TaskManagerProvider extends ChangeNotifier {
  TaskManagerProvider({required this.storage}) {
    _loadLocalTask();
  }

  final List<Task> _tasks = [];
  final LocalStorage storage;

  List<Task> get tasks => _tasks;

  void _loadLocalTask() {
    String? tasks = localStorage.getItem('tasks');
    if (tasks != null) {
      _tasks.addAll((jsonDecode(tasks) as List)
          .map((jsonItem) => Task.fromJson(jsonItem))
          .toList());
    }
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    saveData();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    saveData();
    notifyListeners();
  }

  void saveData() {
    localStorage.setItem(
      'tasks',
      jsonEncode(
        _tasks.map((task) {
          return task.toJson();
        }).toList(),
      ),
    );
  }
}
