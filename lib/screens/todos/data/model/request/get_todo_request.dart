class GetTodoRequest {
  final int page;
  final int limit;

  GetTodoRequest({
    required this.page,
    required this.limit,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page.toString(),
      'limit': limit.toString(),
    };
  }
}
