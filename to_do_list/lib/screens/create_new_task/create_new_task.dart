import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/primary_appbar.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/screens/create_new_task/widgets/alert_task.dart';
import 'package:to_do_list/screens/create_new_task/widgets/priority_item.dart';
import 'package:to_do_list/screens/create_new_task/widgets/schedule.dart';
import 'package:to_do_list/screens/create_new_task/widgets/start_end_time.dart';

import '../../common_widegts/calendar.dart';
import '../../common_widegts/second_button.dart';
import '../../data/model/task_priority.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  TaskPriority? selectedTaskPriority;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: PrimaryAppbar(
          titel: 'Create new task',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Calendar(),
            Schedule(),
            SizedBox(height: 25,),
            StartEndTime(),
            SizedBox(height: 25,),
            PriorityItem(
              selectedTaskPriority: selectedTaskPriority,
              taskPriorities: TaskPriority.values,
              onTaskPriorityChanged: (taskPriority) {
                setState(() {
                  selectedTaskPriority = taskPriority;
                });
              },
            ),
            SizedBox(height: 25,),
            AlertTask(),
            Spacer(),
            SecondButton(title: 'Create Task', onTap: (){})
          ],
        ),
      ),
    );
  }
}
