import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_do_list/screens/todos/data/model/request/create_todo_request.dart';
import 'package:to_do_list/screens/todos/data/model/request/get_todo_request.dart';
import 'package:to_do_list/screens/todos/data/model/response/todo_response.dart';
import 'package:to_do_list/screens/todos/data/todo_model.dart';

abstract class TodoServices {
  Future<List<TodoModel>?> getTodo(GetTodoRequest request);

  Future<TodoResponse> createTodo(CreateTodoRequest request);
  Future<TodoResponse> updateTodo(CreateTodoRequest request);
  Future<TodoResponse> deleteTodo(String id);
}

class TodoServicesImpl implements TodoServices {
  static const String baseUrl = 'https://api.nstack.in/v1/todos';

  /// lấy về danh sách
  @override
  Future<List<TodoModel>?> getTodo(GetTodoRequest request) async {
    /// Bước 1: tạo url
    final url = Uri.parse(baseUrl).replace(queryParameters: request.toJson());

    /// Bước 2: Gửi request GET đến API
    final response = await http.get(url);

    /// Bước 3: Kiểm tra trạng thái của response
    if (response.statusCode == 200) {
      /// Parse dữ liệu JSON từ response body
      final todoResponse = TodoResponse.fromJson(jsonDecode(response.body));

      final todos = todoResponse.items ?? [];
      return todos;
    } else {
      throw Exception('Failed to load with error : ${response.body}');
    }
  }

  /// thêm
  @override
  Future<TodoResponse> createTodo(CreateTodoRequest request) async {
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );

    print('Response body: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Failed to create with error: ${response.body}');
    }

    final responseBody = jsonDecode(response.body);

    if (responseBody == null ) {
      throw Exception('Invalid response format: "items" is null');
    }
    final data = responseBody['data'];
    final todoResponse = TodoResponse.fromJson(responseBody);
    return todoResponse;
  }

  @override
  Future<TodoResponse> deleteTodo(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TodoResponse.fromJson(json);
    }
    else {
      throw Exception('Failed to delete todo with error : ${response.body}');
    }
  }

  @override
  Future<TodoResponse> updateTodo(CreateTodoRequest request) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}
