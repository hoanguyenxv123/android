import 'package:flutter/material.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';
import 'package:intl/intl.dart';

class Item extends StatefulWidget {
  final String title;
  final String description;
  final String time;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback? onTap1;
  const Item(
      {super.key,
      required this.title,
      required this.description,
      required this.time,
      required this.isCompleted, required this.onTap, this.onTap1});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  late DateTime dateTime;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    // Parse chuỗi thành DateTime
    dateTime = DateTime.parse(widget.time).toLocal();
    // Định dạng lại ngày giờ
    formattedDate = DateFormat('HH:mm, dd MMM yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: AppColors.hex181818),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.calendar,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: widget.onTap1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.isCompleted ? AppIcons.check : AppIcons.uncheck,
                    width: 26,
                    height: 26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
