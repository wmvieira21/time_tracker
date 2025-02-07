import 'package:time_tracker/utils/util.dart';

class TimeEntry {
  final String id;
  final String projectId;
  final String taskId;
  final double totalTime;
  final DateTime date;
  final String notes;

  //Generated the Id automatically
  TimeEntry({
    required this.projectId,
    required this.taskId,
    required this.totalTime,
    required this.date,
    required this.notes,
  }) : id = uuidUtil.v4();

  //Used while reading the data saved locally and creating the objects with the same ID.
  TimeEntry.withId({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.totalTime,
    required this.date,
    required this.notes,
  });

  factory TimeEntry.fromJson(dynamic json) {
    return TimeEntry.withId(
      id: json['id'],
      projectId: json['projectId'],
      taskId: json['taskId'],
      totalTime: json['totalTime'],
      date: dateFormatter.parse(json['date']),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'totalTime': totalTime,
      'date': dateFormatter.format(date),
      'notes': notes,
    };
  }
}
