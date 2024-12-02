import 'dart:ui';

import '../../constants/app_colors.dart';

enum TaskPriority { high, medium, low }

/// Một extension của TaskPriority để thêm các phương thức mở rộng
extension TaskPriorityExtention on TaskPriority {
  /// Phương thức getColor trả về màu của mức độ ưu tiên
  Color get color {
    /// Trả về màu tương ứng với mức độ ưu tiên
    switch (this) {
      case TaskPriority.high:
        return AppColors.hexFACBBA;
      case TaskPriority.medium:
        return AppColors.hexD7F0FF;
      case TaskPriority.low:
        return AppColors.hexFAD9FF;
    }
  }

  /// Phương thức getTitle trả về tiêu đề của mức độ ưu tiên
  String get title {
    switch (this) {
      case TaskPriority.high:
        return "High";
      case TaskPriority.medium:
        return "Medium";
      case TaskPriority.low:
        return "Low";
    }
  }
}
