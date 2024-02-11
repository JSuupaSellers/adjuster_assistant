import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String description;
  bool isCompleted;

  Task({
    required this.description,
    String? id,
    bool? isCompleted,
  })  : id = id ?? const Uuid().v4(),
        isCompleted = isCompleted ?? false;
}
