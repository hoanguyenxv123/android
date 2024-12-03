import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';

import '../../../common_widegts/second_button.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SecondButton(title: 'Edit Task', onTap: (){})),
        SizedBox(width: 10,),
        Expanded(
          child: GestureDetector(
            onTap: (){},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                color: Color(0xFF4F4F4F).withOpacity(0.8)
              ),
              child: Center(
                child: Text(
                  'Delete Task',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
