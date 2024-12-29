import '../../meta_model.dart';
import '../../todo_model.dart';

class TodoResponse {
  int? code;
  bool success;
  int? timestamp;
  String message;
  List<TodoModel> items;
  MetaModel? data;

  TodoResponse({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.data,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
    code: json["code"] ?? 0,
    success: json["success"] ?? false,
    timestamp: (json["timestamp"] != null && json["timestamp"] is int)
        ? json["timestamp"]
        : 0, // Kiểm tra kiểu dữ liệu của timestamp
    message: json["message"] ?? '',
    items: json["items"] != null
        ? List<TodoModel>.from(
        json["items"].map((x) => TodoModel.fromJson(x)))
        : [],
    data: json["data"] != null
        ? MetaModel.fromJson(json["data"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "timestamp": timestamp,
    "message": message,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "data": data?.toJson(),
  };
}
