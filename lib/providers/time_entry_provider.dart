import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/time_entry.dart';

class TimeEntryProvider extends ChangeNotifier {
  TimeEntryProvider({required this.storage}) {
    _loadLocalEntries();
  }

  final List<TimeEntry> _entries = [];
  LocalStorage storage;

  List<TimeEntry> get entries => _entries;

  void _loadLocalEntries() {
    String? entries = localStorage.getItem('timeEntries');
    if (entries != null) {
      _entries.addAll((jsonDecode(entries) as List)
          .map((jsonItem) => TimeEntry.fromJson(jsonItem))
          .toList());
    }
    notifyListeners();
  }

  void addTimeEntry(TimeEntry entry) {
    _entries.add(entry);
    saveData();
    notifyListeners();
  }

  void deleteTimeEntry(TimeEntry timeEntry) {
    _entries.remove(timeEntry);
    saveData();
    notifyListeners();
  }

  void saveData() {
    try {
      localStorage.setItem(
        'timeEntries',
        jsonEncode(
          _entries.map((entry) {
            return entry.toJson();
          }).toList(),
        ),
      );
    } catch (e) {
      print('saving error $e');
    }
  }
}
