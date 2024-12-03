import 'package:flutter/material.dart';

import 'task/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Color(0xFFBA83DE)),
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MyBVN(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 10), // Khoảng cách giữa ảnh và text
                    Expanded(
                      child: Text(
                        'Flutter là mobile UI framework '
                            'của Google để tạo ra các giao diện '
                            'chất lượng cao trên iOS và '
                            'Android trong khoảng thời gian ngắn',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Nguyễn ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Đức ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: 'Hòa',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
