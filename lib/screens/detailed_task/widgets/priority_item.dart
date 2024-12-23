import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/primary_button.dart';

import '../../../common_widegts/primary_title.dart';
import '../../../data/model/task_priority.dart';

class PriorityItem extends StatelessWidget {
  const PriorityItem({
    required this.selectedTaskPriority,
    required this.taskPriorities,
    required this.onTaskPriorityChanged,
    super.key,
  });

  /// Mức ưu tiên được chọn
  final TaskPriority? selectedTaskPriority;

  /// Danh sách các mức ưu tiên
  final List<TaskPriority> taskPriorities;

  /// Hàm được gọi khi người dùng thay đổi mức ưu tiên
  final ValueChanged<TaskPriority> onTaskPriorityChanged;

  /// Hàm build chứa nội dung của PriorityItem
  @override
  Widget build(BuildContext context) {
    /// Danh sách các widget con của PriorityItem
    List<Widget> children = [];

    /// Duyệt qua danh sách các mức ưu tiên
    for (int i = 0; i < taskPriorities.length; i++) {
      /// Thêm một nút vào danh sách các widget con
      children.add(
        Expanded( /// Expanded là một widget để mở rộng widget con theo chiều ngang
          child: PrimaryButton( /// SecondaryButton là một StatelessWidget để hiển thị một nút phụ
            level: taskPriorities[i].title, /// Tiêu đề của nút
            isCheck: selectedTaskPriority == taskPriorities[i], /// Nếu mức ưu tiên được chọn bằng mức ưu tiên hiện tại thì nút được chọn
            color: taskPriorities[i].color, /// Màu của nút
            onTap: () { /// Hàm được gọi khi người dùng nhấn vào nút
              onTaskPriorityChanged.call(taskPriorities[i]); /// Gọi hàm onTaskPriorityChanged với tham số là mức ưu tiên hiện tại
            },
          ),
        ),
      );

      if (i < taskPriorities.length - 1) {
        children.add(const SizedBox(width: 10));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTitle(title: 'Priority'),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: children,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
