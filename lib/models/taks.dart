import 'package:time_tracker/utils/util.dart';

class Task {
  final String id;
  final String name;

  //Generated the Id automatically
  Task({required this.name}) : id = uuidUtil.v4();

  //Used while reading the data saved locally and creating the objects with the same ID.
  Task.withID({required this.id, required this.name});

  factory Task.fromJson(dynamic json) {
    return Task.withID(name: json['name'], id: json['id']);
  }

  Map<String, String> toJson() {
    return {'id': id, 'name': name};
  }
}
