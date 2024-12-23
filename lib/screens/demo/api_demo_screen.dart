import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_list/screens/demo/model/api_service.dart';
import 'package:to_do_list/screens/demo/model/todo_model.dart';
import 'package:to_do_list/screens/demo/model/todo_response.dart';

class ApiDemoScreen extends StatefulWidget {
  const ApiDemoScreen({super.key});

  @override
  State<ApiDemoScreen> createState() => _ApiDemoScreenState();
}

/// Hàm lấy danh sách công việc
class _ApiDemoScreenState extends State<ApiDemoScreen> {
  // Future<List<TodoModel>?> getTodos() async {
  //   /// Tạo 1 Uri từ chuỗi
  //   final url = Uri.parse('https://dummyjson.com/todos');
  //
  //   /// gửi yêu cầu GET đến url
  //   final response = await http.get(url);
  //
  //   /// Kiểm tra xem yêu cầu có thành công không
  //   if (response.statusCode == 200) {
  //     /// Decode dữ liệu nhận được từ server
  //     final data = jsonDecode(response.body);
  //
  //     /// Tạo 1 đối tượng TodoResponse từ dữ liệu nhận được
  //     final todoResponse = TodoResponse.fromJson(data);
  //
  //     final todos = todoResponse.todos;
  //     return todos;
  //   } else {
  //     debugPrint('Request failed with status : ${response.statusCode}');
  //     return null;
  //   }
  // }

  final ApiService apiService = ApiService();
  List<dynamic> todos = [];

  @override
  void initState() {
    // getTodos();
    fetchTodos();
    super.initState();
  }

  // load dữ liệu lấy danh sách
  Future<void> fetchTodos() async {
    try {
      final data = await apiService.getTodos();
      print('Fetched todos: $data'); // In ra dữ liệu
      setState(() {
        todos = data ?? [];
      });
    } catch (e) {
      print('Error fetching todos: $e');
    }
  }

  /// post
  Future<void> addTodo() async {
    try {
      await apiService.addTodo('New Todo', true);
      print('Todo added successfully');
      fetchTodos();
    } catch (e) {
      print('Error adding todo: $e');
    }
  }

  /// put
  Future<void> updateTodo(String id) async {
    try {
      await apiService.updateTodo(id, 'Update Todo', false);
      fetchTodos();
    } catch (e) {
      print('Error updating todo: $e');
    }
  }

  /// delete
  Future<void> deleteTodo(String id) async {
    try {
      await apiService.deleteTodo(id);
      fetchTodos();
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // created, read, update, delete
        title: Text('API Demo with CRUD'),
        actions: [IconButton(onPressed: addTodo, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text('${todo['title']} $index'),
            subtitle: Text('Completed: ${todo['is_completed']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      updateTodo(todo['_id'].toString());
                    },
                    icon: Icon(Icons.update)),
                IconButton(
                    onPressed: () {
                      deleteTodo(todo['_id'].toString());
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
