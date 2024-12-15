import 'package:buoi5/create_new/create_new_task.dart';
import 'package:buoi5/task/daily_task.dart';
import 'package:buoi5/task/header.dart';
import 'package:buoi5/task/search_task.dart';
import 'package:buoi5/task/tasks.dart';
import 'package:flutter/material.dart';

import 'day_task.dart';

class MyBVN extends StatefulWidget {
  const MyBVN({super.key});

  @override
  State<MyBVN> createState() => _MyBVNState();
}

class _MyBVNState extends State<MyBVN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFDE83B0),
              Color(0xFFC59ADF),
            ],
            begin: Alignment.topLeft, // Bắt đầu từ góc trên bên trái
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle, // Đặt hình dạng thành hình tròn
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder:
                  (context)=> CreateNewTask()
              )
            );
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Header(),
              SizedBox(height: 20,),
              SearchTask(),
              SizedBox(height: 30,),
              DailyTask(),
              SizedBox(height: 30),
              DayTask(),
              SizedBox(height: 10),
              // Thay đổi ListView thành một widget khác không cần Expanded
              ListView(
                shrinkWrap: true, // Thêm thuộc tính này để ListView có thể co lại
                physics: NeverScrollableScrollPhysics(), // Ngăn ListView cuộn
                children: [
                  TodayTask(
                    color: Color(0xFFFFDCC8),
                    title: 'Mobie App Research',
                    time: '4 Oct',
                    isSelected: true,
                  ),
                  TodayTask(
                    color: Color(0xFFC8E6FF),
                    title: 'Prepare Wireframe for Main Flow',
                    time: '4 Oct',
                    isSelected: true,
                  ),
                  TodayTask(
                    color: Color(0xFFDCC8E6),
                    title: 'Prepare Screens',
                    time: '4 Oct',
                    isSelected: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
