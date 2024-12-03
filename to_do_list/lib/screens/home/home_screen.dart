import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/data/model/task_model.dart';
import 'package:to_do_list/screens/home/widegts/button_addnew.dart';
import 'package:to_do_list/screens/home/widegts/header_item.dart';
import 'package:to_do_list/screens/home/widegts/home_appbar.dart';
import 'package:to_do_list/screens/home/widegts/progress_item.dart';
import 'package:to_do_list/screens/home/widegts/task_item.dart';

import '../../data/model/task_priority.dart';
import '../../data/model/task_status.dart';
import '../create_new_task/create_new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tasks = <TaskModel>[
    TaskModel(
      id: 1,
      name: 'Mobile App Research',
      description:
          'Mobile App Research :- Based on food app and see user '
              'flow and find problem if any',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.high,
      taskStatus: TaskStatus.complete,
      alter: true,
    ),
    TaskModel(
      id: 2,
      name: 'Prepare Wireframe for Main Flow',
      description: 'Prepare Wireframe for Main Flow',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.medium,
      taskStatus: TaskStatus.complete,
      alter: true,
    ),
    TaskModel(
      id: 3,
      name: 'Prepare Screens',
      description: 'Prepare Screens',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      date: DateTime.now(),
      priority: TaskPriority.low,
      taskStatus: TaskStatus.incomplete,
      alter: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: HomeAppbar(
        onSearchChanged: (value) {
          print('hello $value');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              HeaderItem(title: 'Progress'),
              ProgressItem(
                numberOfCompletedTask: tasks
                    .where((task) => task.taskStatus == TaskStatus.complete)
                    .length,
                numberOfTask: tasks.length,
              ),
              HeaderItem(title: "Today's Task"),
              Column(
                children: tasks
                    .map(
                      (taskModel) => TaskItem(
                        taskModel: taskModel,
                        onStatusChanged: (taskStatus) {
                          final index = tasks.indexWhere(
                            (e) => e.id == taskModel.id,
                          );
                          if (index != -1) {
                            setState(() {
                              tasks[index] = taskModel.copyWith(
                                taskStatus: taskStatus,
                              );
                            });
                          } else {
                            print('Task not found');
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
              HeaderItem(title: 'Tomorrow Task'),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonAddnew(onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewTask()));
      }),
    );
  }
}
