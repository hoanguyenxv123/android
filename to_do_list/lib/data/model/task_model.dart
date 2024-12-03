import 'package:intl/intl.dart';
import 'package:to_do_list/data/model/task_priority.dart';
import 'package:to_do_list/data/model/task_status.dart';

class TaskModel {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
   bool alter;
  final TaskPriority priority;
  final TaskStatus taskStatus;

  TaskModel({required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.alter,
    required this.priority,
    required this.taskStatus});

  TaskModel copyWith({int? id,
    String? name,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    DateTime? date,
    TaskPriority? priority,
    TaskStatus? taskStatus,
    bool? alter}) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      taskStatus: taskStatus ?? this.taskStatus,
      alter: alter ?? this.alter,
    );
  }
}
extension TaskModelExtension on TaskModel {
  String get displayDate {
    final dateFormat = DateFormat('d MMM');
    return dateFormat.format(date);
  }
}

