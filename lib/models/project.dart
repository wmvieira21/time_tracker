import 'package:time_tracker/utils/util.dart';

class Project {
  final String id;
  final String name;
  final bool isDefault;

  //Generated the Id automatically
  Project({required this.name, this.isDefault = false}) : id = uuidUtil.v4();

  //Used while reading the data saved locally and creating the objects with the same ID.
  Project.withID(
      {required this.id, required this.name, this.isDefault = false});

  factory Project.fromJson(dynamic json) {
    return Project.withID(
        id: json['id'], name: json['name'], isDefault: json['isDefault']);
  }

  Map<String, Object> toJson() {
    return {'id': id, 'name': name, 'isDefault': isDefault};
  }
}
