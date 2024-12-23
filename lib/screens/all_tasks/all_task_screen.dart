import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/primary_appbar.dart';

import '../../constants/app_colors.dart';
import '../../data/model/task_model.dart';
import '../home/widegts/task_item.dart';

/// Màn hình hiển thị tất cả công việc
class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({
    super.key,
    required this.tasks, required this.index,
  });

  /// Danh sách tất cả công việc
  final List<TaskModel> tasks;
  final int index;

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    final allTasks = widget.tasks;

    final todayTasks = allTasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now(),
      );
    }).toList();

    final tomorrowTasks = allTasks.where((task) {
      return DateUtils.isSameDay(
        task.date,
        DateTime.now().add(
          const Duration(days: 1),
        ),
      );
    }).toList();

    return DefaultTabController(
      initialIndex: widget.index,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.hex020206,
        appBar: PrimaryAppbar(
          title: 'All Tasks',
        ),
        body: Column(
          children: [
            /// TabBar là một widget dùng để hiển thị các tab
            const TabBar(
              /// Màu của tab được chọn
              indicatorColor: AppColors.hexDE83B0,

              /// Độ dày của tab được chọn
              indicatorWeight: 2,

              /// Kích thước của tab được chọn
              indicatorSize: TabBarIndicatorSize.tab,

              /// Màu chữ của tab
              labelColor: AppColors.hexDE83B0,

              /// Kiểu chữ của tab
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),

              /// Danh sách các tab
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Today'),
                Tab(text: 'Tomorrow'),
              ],
            ),
            Expanded(
              /// TabBarView là một widget dùng để hiển thị nội dung của các tab
              child: TabBarView(
                children: [
                  /// Hiển thị tất cả công việc
                  _buildTabBarContentView(tasks: allTasks),

                  /// Hiển thị công việc trong ngày
                  _buildTabBarContentView(tasks: todayTasks),

                  /// Hiển thị công việc trong ngày mai
                  _buildTabBarContentView(tasks: tomorrowTasks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Hàm build chứa nội dung của TabBarView
  Widget _buildTabBarContentView({
    required List<TaskModel> tasks,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return TaskItem(
          taskModel: tasks[index],
          onStatusChanged: (taskStatus) {},
        );
      },
      itemCount: tasks.length,
    );
  }
}
