class CreateTodoRequest {
  final String title;
  final String description;
  final bool isCompleted;

  CreateTodoRequest({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'is_completed': isCompleted
    };
  }
}
