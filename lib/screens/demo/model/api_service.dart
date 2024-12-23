import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.nstack.in/v1/todos';

  /// Lấy danh sách todos
  Future<List<dynamic>?> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}'); // In ra phản hồi
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      // Lấy danh sách todos từ trường 'items'
      if (data.containsKey('items')) {
        return data['items'] as List<dynamic>?; // Trả về danh sách todos
      } else {
        print('No items found in response');
        return null;
      }
    } else {
      throw Exception('Failed to load todos');
    }
  }

  /// Thêm mới todo
  Future<void> addTodo(String title, bool completed) async {
    /// gửi yêu cầu post đến url
    final response = await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // mã hóa
          'title': title,
          'is_completed': completed
        }));
    if (response.statusCode != 201) {
      // tạo mới 201 created
      print('Response Body: ${response.body}');
      throw Exception('Failed to add todo');
    }
  }

  /// Cập nhật todo
  Future<void> updateTodo(String id, String title, bool completed) async {
    /// gửi yêu cầu put đến url
    final response = await http.put(Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': title, 'is_completed': completed}));
    if (response.statusCode != 200) {
      throw Exception('Failed to update todo');
    }
  }

  /// Xóa todo
  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }
}
