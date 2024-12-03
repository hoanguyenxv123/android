import 'package:buoi5/create_new/button_check.dart';
import 'package:buoi5/create_new/calendar.dart';
import 'package:buoi5/create_new/priority.dart';
import 'package:buoi5/create_new/text_data.dart';
import 'package:buoi5/create_new/times.dart';
import 'package:flutter/material.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            size: 30,
          ),
          color: Colors.white,
        ),
        title: Text(
          'Create new task',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white, // Màu chữ trắng
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Calendar(),
            Text(
              'Schedule',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            TextData(),
            SizedBox(
              height: 20,
            ),
            Times(),
            SizedBox(
              height: 20,
            ),
            Priority(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Get alert for this task',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                ButtonCheck()
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFFBA83DE),
                  Color(0xFFCD83C6),
                  Color(0xFFDE83B0),
                ],
                    ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(
                  child: Text(
                    'Create Task',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
