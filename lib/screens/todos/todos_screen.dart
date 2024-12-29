import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/screens/todos/data/model/request/create_todo_request.dart';
import 'package:to_do_list/screens/todos/data/model/request/get_todo_request.dart';
import 'package:to_do_list/screens/todos/data/todo_model.dart';
import 'package:to_do_list/screens/todos/screens/crud_screen.dart';
import 'package:to_do_list/screens/todos/screens/item.dart';

import '../home/widegts/button_addnew.dart';
import 'data/data_sources/todo_services.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final TodoServices todoServices = TodoServicesImpl();

  List<TodoModel> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchTodos();
    print(todos);
    super.initState();
  }

  Future<void> fetchTodos() async {
    final request = GetTodoRequest(
      page: 1,
      limit: 10,
    );
    setState(() {
      isLoading = true;
    });
    try {
      final data = await todoServices.getTodo(request);
      setState(() {
        todos = data ?? [];
      });
    } catch (e) {
      debugPrint('Error : $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Lấy danh sách
  Future<void> getTodos() async {
    final request = GetTodoRequest(
      page: 1,
      limit: 10,
    );
    final todos = await todoServices.getTodo(request);
  }

  /// Thêm mới
  Future<void> createTodo(String title, String description) async {
    final request = CreateTodoRequest(
      title: title,
      description: description,
      isCompleted: false,
    );

    setState(() {
      isLoading = true;
    });

    try {
      final todoResponse = await todoServices.createTodo(request);
      if (todoResponse.items.isNotEmpty) {
        final newTodo =
            todoResponse.items.first; // Lấy Todo đầu tiên từ danh sách
        setState(() {
          todos.add(TodoModel(
            id: newTodo.id,
            title: newTodo.title,
            description: newTodo.description,
            isCompleted: newTodo.isCompleted,
            createdAt: newTodo.createdAt,
            updatedAt: newTodo.updatedAt,
          ));
        });
      }
    } catch (e) {
      debugPrint('Error creating todo: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Xóa Todo
  Future<void> deleteTodo(String id) async {
    setState(() {
      isLoading = true;
    });

    try {
      final todoResponse = await todoServices.deleteTodo(id);

      if (todoResponse.success) {
        // Kiểm tra xem API trả về thành công không
        setState(() {
          todos.removeWhere((todo) => todo.id == id); // Xóa Todo khỏi danh sách
        });
      } else {
        debugPrint('Failed to delete todo: ${todoResponse.message}');
      }
    } catch (e) {
      debugPrint('Error deleting todo: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Todos',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.hexBA83DE,
              ),
            )
          : todos.isNotEmpty
              ? ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Item(
                      onTap: () {
                        print('Selected Todo ID: ${todo.id}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CrudScreen(
                              isEdit: true,
                              initialTitle: todo.title,
                              initialDescription: todo.description,
                            ),
                          ),
                        );
                      },
                      title: todo.title,
                      description: todo.description,
                      isCompleted: todo.isCompleted,
                      time: todo.updatedAt.toString() ?? '',
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No todos',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          fetchTodos();
                        },
                        child: Text(
                          'Reload',
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.hex181818,
                            foregroundColor: AppColors.hexBA83DE),
                      )
                    ],
                  ),
                ),
      floatingActionButton: ButtonAddnew(
        onTap: () {
          Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => CrudScreen(),
            ),
          ).then((result) {
            if (result != null) {
              // Thêm Todo mới vào danh sách
              setState(() {
                createTodo(result['title']!, result['description']!);
              });
            }
          });
        },
      ),
    );
  }
}
