import 'package:flutter/material.dart';

class SearchTask extends StatefulWidget {
  const SearchTask({super.key});

  @override
  State<SearchTask> createState() => _SearchTaskState();
}

class _SearchTaskState extends State<SearchTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF1E1E1E)
      ),
      child: Center(
        child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.white,size: 24,),
            border: InputBorder.none,
            hintText: 'Search Task Here',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 20
            )
          ),
        ),
      ),
    );
  }
}
