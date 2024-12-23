import 'package:to_do_list/screens/demo/model/todo_model.dart';

class TodoResponse {
  final List<TodoModel> todos;
  final int total;
  final int skip;
  final int limit;

  TodoResponse({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  /// chuyển từ JSON sang object dart
  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
        todos: List<TodoModel>.from(
          json['todos'].map((x) => TodoModel.fromJson(x)),
        ),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );
  /// Chuyển từ object dart sang JSON
  Map<String, dynamic> toJson() => {
        'todos': List<dynamic>.from(todos.map((x) => x.toJson())),
        'total': total,
        "skip": skip,
        'limit': limit
      };
}
