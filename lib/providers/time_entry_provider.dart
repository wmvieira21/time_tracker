import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:time_tracker/models/time_entry.dart';

class TimeEntryProvider extends ChangeNotifier {
  TimeEntryProvider({required this.storage}) {
    _loadLocalEntries();
  }

  List<TimeEntry> _entries = [];
  LocalStorage storage;

  List<TimeEntry> get entries => _entries;

  void _loadLocalEntries() {
    _entries = [];
  }

  void addTimeEntry(TimeEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void deleteTimeEntry(TimeEntry timeEntry) {
    _entries.remove(timeEntry);
    notifyListeners();
  }
}
