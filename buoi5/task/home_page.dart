import 'package:buoi5/task/tasks.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Bai ve nha 5'),
        actions: [
          Icon(Icons.favorite),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(
                    0xFF181818,
                  ),
                  borderRadius: BorderRadius.circular(15)),
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
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '2/3 Task Completed',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(
                      height: 2,
                    ),
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
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 20,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0x68BA83DE),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xFFBA83DE),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TodayTask(
              color: Color(0xFFFFDCC8),
              titel: 'Mobie App Research',
              time: '4 Oct',
              chon: true,
            ),
            TodayTask(
              color: Color(0xFFC8E6FF),
              titel: 'Prepare Wireframe for Main Flow',
              time: '4 Oct',
              chon: true,
            ),
            TodayTask(
              color: Color(0xFFDCC8E6),
              titel: 'Prepare Screeens',
              time: '4 Oct',
              chon: false,
            ),
          ],
        ),
      ),
    );
  }
}


