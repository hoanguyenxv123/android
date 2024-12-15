import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';
import 'package:to_do_list/data/model/task_model.dart';
import 'package:to_do_list/data/model/task_priority.dart';
import 'package:to_do_list/data/model/task_status.dart';
import 'package:to_do_list/screens/detailed_task/detailed_task.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  final ValueChanged<TaskStatus> onStatusChanged;

  const TaskItem(
      {super.key, required this.taskModel, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5
      ),
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.hex181818, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: 15,
            decoration: BoxDecoration(
              color: taskModel.priority.color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 20),

          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailedTask(taskModel: taskModel),
                  ),
                );
              },
              child: Container( // Bọc bên trong với Container để làm vùng nhấn rộng hơn
                padding: EdgeInsets.all(10),  // Thêm khoảng đệm nếu cần
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      taskModel.name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.calendar,
                          width: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          taskModel.displayDate,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // GestureDetector cho icon trạng thái
          GestureDetector(
            onTap: () {
              if (taskModel.taskStatus == TaskStatus.incomplete) {
                onStatusChanged.call(TaskStatus.complete);
              } else {
                onStatusChanged.call(TaskStatus.incomplete);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                taskModel.taskStatus.icon,
                width: 26,
                height: 26,
              ),
            ),
          ),
        ],
      )
    );
  }
}
