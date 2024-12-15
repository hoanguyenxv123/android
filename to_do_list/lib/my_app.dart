import 'package:flutter/material.dart';
import 'package:to_do_list/screens/main/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
