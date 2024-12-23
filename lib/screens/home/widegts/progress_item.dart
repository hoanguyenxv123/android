import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';

class ProgressItem extends StatelessWidget {
  final int numberOfTask;
  final int numberOfCompletedTask;

  const ProgressItem(
      {super.key,
      required this.numberOfTask,
      required this.numberOfCompletedTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.hex181818, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Task',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$numberOfCompletedTask/$numberOfTask Task Completed',
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You are almost done go ahead',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 16),
              ),
              Text(
                // floor : 66.67 -> 66
                // round : 66.67 -> 67
                '${(numberOfCompletedTask * 100 / numberOfTask).floor()}%',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 18,
            decoration: BoxDecoration(
                color: AppColors.hexBA83DE.withOpacity(0.41),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width -40)*
                      (numberOfCompletedTask / numberOfTask),
                  decoration: BoxDecoration(
                      color: AppColors.hexBA83DE,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
