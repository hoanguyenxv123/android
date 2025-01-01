import '../../meta_model.dart';
import '../../todo_model.dart';

class TodoResponse {
  int? code;
  bool success;
  int? timestamp;
  String message;
  List<TodoModel> items;
  MetaModel? meta;
  TodoModel? data;

  TodoResponse({
    this.code, // Optional because the API might return null
    required this.success,
    this.timestamp, // Optional since it can be null
    required this.message,
    required this.items,
    this.data, // Optional because it might not be provided
    this.meta, // Optional, based on the API response
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      code: json["code"] ?? 0,
      success: json["success"] ?? false,
      timestamp: json["timestamp"], // Handle timestamp, allow null
      message: json["message"] ?? '',
      items: json["items"] != null
          ? List<TodoModel>.from(json["items"].map((x) => TodoModel.fromJson(x)))
          : [],
      data: json["data"] != null
          ? TodoModel.fromJson(json["data"]) // Corrected this part (should be TodoModel, not MetaModel)
          : null,
      meta: json["meta"] != null
          ? MetaModel.fromJson(json["meta"]) // Corrected to handle meta
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "timestamp": timestamp,
    "message": message,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "data": data?.toJson(),
    "meta": meta?.toJson(), // Include meta if available
  };
}
