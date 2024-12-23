class TodoModel {
  final int id;
  final String todo;
  final bool? completed;
  final int userId;

  TodoModel(
      {required this.id,
      required this.todo,
      this.completed,
      required this.userId});

  /// chuyển đồi từ JSON sang object dart
  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['complete'] ?? false,
      userId: json['userId']);

  /// chuyển đổi từ oject dart sang JSON
  Map<String, dynamic> toJson() =>
      {'id': id, 'todo': todo, 'complete': completed, 'userId': userId};
}
