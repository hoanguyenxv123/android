import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/screens/todos/data/model/request/create_todo_request.dart';
import 'package:to_do_list/screens/todos/data/model/request/get_todo_request.dart';
import 'package:to_do_list/screens/todos/data/model/response/todo_response.dart';
import 'package:to_do_list/screens/todos/data/todo_model.dart';

abstract class TodoServices {
  Future<List<TodoModel>?> getTodo(GetTodoRequest request);

  Future<List<TodoModel>?> getTodoId(String id);

  Future<TodoResponse> createTodo(CreateTodoRequest request);

  Future<TodoResponse> updateTodo(String id, CreateTodoRequest request);

  Future<TodoResponse> deleteTodo(String id);
}

class TodoServicesImpl implements TodoServices {
  static const String baseUrl = 'https://api.nstack.in/v1/todos';

  /// lấy về danh sách
  @override
  Future<List<TodoModel>?> getTodo(GetTodoRequest request) async {
    final url = Uri.parse(baseUrl).replace(queryParameters: request.toJson());

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final todoResponse = TodoResponse.fromJson(jsonDecode(response.body));
        final todos = todoResponse.items ?? [];
        return todos;
      } else {
        throw Exception('Failed to load with error: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error while fetching todos: $e');
      rethrow;
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

    if (response.statusCode != 201) {
      throw Exception('Failed to create with error: ${response.body}');
    }

    final responseBody = jsonDecode(response.body);
    if (responseBody == null) {
      throw Exception('Invalid response format: "items" is null');
    }

    final todoResponse = TodoResponse.fromJson(responseBody);
    return todoResponse;
  }

  /// Xóa
  @override
  Future<TodoResponse> deleteTodo(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TodoResponse.fromJson(json);
    } else {
      throw Exception('Failed to delete todo with error : ${response.body}');
    }
  }

  /// Cập nhật
  @override
  Future<TodoResponse> updateTodo(String id,CreateTodoRequest request) async {
    final url = Uri.parse('$baseUrl/$id');

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to updateTodo with error: ${response.body}');
    }

    final responseBody = jsonDecode(response.body);
    if (responseBody == null) {
      throw Exception('Invalid response format: "items" is null');
    }

    final todoResponse = TodoResponse.fromJson(responseBody);
    return todoResponse;
  }

  @override
  Future<List<TodoModel>?> getTodoId(String id) async {
    final url = Uri.parse('$baseUrl/$id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final todoResponse = TodoResponse.fromJson(jsonDecode(response.body));
        final todos = todoResponse.items ?? [];
        return todos;
      } else {
        throw Exception('Failed to load with error: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error while fetching todos: $e');
      rethrow;
    }
  }
}
