import 'package:time_tracker/utils/util.dart';

class Project {
  final String id;
  final String name;

  //Generated the Id automatically
  Project({required this.name}) : id = uuidUtil.v4();

  //Used while reading the data saved locally and creating the objects with the same ID.
  Project.withID({required this.id, required this.name});

  factory Project.fromJson(dynamic json) {
    return Project.withID(name: json['name'], id: json['id']);
  }

  Map<String, String> toJson(Project project) {
    return {'id': id, 'name': name};
  }
}
