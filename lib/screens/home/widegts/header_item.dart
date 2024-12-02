import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';

class HeaderItem extends StatelessWidget {
  final String title;
  const HeaderItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero
          ),
            onPressed: (){},
            child: Text('See All',style: TextStyle(
              fontSize: 16,
              color: AppColors.hexBA83DE
            ),)
        ),
      ],
    );
  }
}
