import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/primary_appbar.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/screens/detailed_task/widgets/alert_task.dart';
import 'package:to_do_list/screens/detailed_task/widgets/operation_button.dart';
import 'package:to_do_list/screens/detailed_task/widgets/priority_item.dart';
import 'package:to_do_list/screens/detailed_task/widgets/start_end_time.dart';
import 'package:to_do_list/screens/detailed_task/widgets/schedule.dart';

import '../../common_widegts/calendar.dart';
import '../../data/model/task_model.dart';
import '../../data/model/task_priority.dart';

class DetailedTask extends StatefulWidget {
  final TaskModel taskModel;
  const DetailedTask({super.key, required this.taskModel});

  @override
  State<DetailedTask> createState() => _DetailedTaskState();
}

class _DetailedTaskState extends State<DetailedTask> {
  TaskPriority? selectedTaskPriority;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: PrimaryAppbar(
        title: widget.taskModel.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Calendar(),
            Schedule(name: widget.taskModel.name,description: widget.taskModel.description,),
            SizedBox(height: 25,),
            StartEndTime(),
            SizedBox(height: 25,),
            PriorityItem(
              selectedTaskPriority: widget.taskModel.priority,
              taskPriorities: TaskPriority.values,
              onTaskPriorityChanged: (taskPriority) {
                setState(() {
                  selectedTaskPriority = taskPriority;
                });
              },
            ),
            SizedBox(height: 25,),
            AlertTask(check: widget.taskModel.alter, onCheckChanged: (newValue) {
              setState(() {
                widget.taskModel.alter = newValue; // Update the task model
              });
            },),
            Spacer(),
            OperationButton()
          ],
        ),
      ),
    );
  }
}
