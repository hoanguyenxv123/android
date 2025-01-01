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
    super.initState();
  }

  /// Load dữ liệu
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
      debugPrint('Data $data');
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

  /// Detail
  Future<void> getTodoId(String id) async {
    try {
      final data = await todoServices.getTodoId(id);
    } catch (e) {
      debugPrint('Error detail todo : $e');
    }
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
        debugPrint('Current Todos List: $todos');
      }
    } catch (e) {
      debugPrint('Error creating todo: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  /// Cập nhật Todo
  Future<void> updateTodo(
      String id, String title, String description, bool isCompleted) async {
    final request = CreateTodoRequest(
      title: title,
      description: description,
      isCompleted: isCompleted,
    );

    setState(() {
      isLoading = true;
    });

    try {
      // Gọi API cập nhật Todo
      final todoResponse = await todoServices.updateTodo(id, request);

      if (todoResponse.success) {
        setState(() {
          final index = todos.indexWhere((todo) => todo.id == id);
          if (index != -1) {
            todos[index] = TodoModel(
              id: id,
              title: title,
              description: description,
              isCompleted: isCompleted,
              createdAt: todos[index].createdAt,
              // Giữ nguyên ngày tạo
              updatedAt: DateTime.now(), // Cập nhật ngày sửa
            );
          }
        });
        debugPrint('Todo updated successfully: $id');
      } else {
        debugPrint('Failed to update todo: ${todoResponse.message}');
      }
    } catch (e) {
      debugPrint('Error updating todo: $e');
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CrudScreen(
                              isEdit: true,
                              initialTitle: todo.title,
                              initialDescription: todo.description,
                              todoId: todo.id,
                              // Truyền ID của Todo
                              onDelete: () async {
                                await deleteTodo(todo.id); // Gọi hàm deleteTodo
                                fetchTodos();
                                debugPrint(
                                    'Xóa thành công'); // Làm mới danh sách sau khi xóa
                                Navigator.pop(
                                    context); // Quay lại màn hình trước
                              },
                            ),
                          ),
                        ).then((result) {
                          if (result != null) {
                            // Nếu có kết quả trả về từ CrudScreen, cập nhật Todo
                            updateTodo(
                              result['id']!,
                              result['title']!,
                              result['description']!,
                              false, // Hoặc true nếu bạn muốn cập nhật trạng thái hoàn thành
                            );
                          }
                        });
                      },
                      title: todo.title,
                      description: todo.description,
                      isCompleted: todo.isCompleted,
                      time: todo.updatedAt.toString() ?? '',
                      onTap1: () {
                        setState(() {
                          updateTodo(
                            todo.id,
                            todo.title,
                            todo.description,
                            !todo.isCompleted,
                          );
                        });
                      },
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
        onTap: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (context) => CrudScreen(),
            ),
          );

          if (result != null) {
            // Thêm Todo mới vào danh sách và gọi lại fetchTodos để cập nhật dữ liệu
            await createTodo(result['title']!, result['description']!);
            fetchTodos();
          }
        },
      ),
    );
  }
}
