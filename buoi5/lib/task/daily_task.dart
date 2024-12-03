import 'package:flutter/material.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({super.key});

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF181818),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Task',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 2),
            Text(
              '2/3 Task Completed',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You are almost done go ahead',
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
                Text(
                  '66%',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0x68BA83DE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.66,
                      decoration: BoxDecoration(
                        color: Color(0xFFBA83DE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
