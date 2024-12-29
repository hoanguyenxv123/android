import 'package:flutter/material.dart';
import 'package:to_do_list/common_widegts/second_button.dart';
import 'package:to_do_list/constants/app_colors.dart';
import 'package:to_do_list/constants/app_icons.dart';

import '../../../common_widegts/text_data.dart';
import '../data/data_sources/todo_services.dart';

class CrudScreen extends StatefulWidget {
  final bool isEdit; // Xác định chế độ Create hay Edit
  final String? initialTitle;
  final String? initialDescription;

  const CrudScreen({
    super.key,
    this.isEdit = false,
    this.initialTitle,
    this.initialDescription,
  });

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _titleController.text = widget.initialTitle ?? '';
      _descriptionController.text = widget.initialDescription ?? '';
    }
  }

  final TodoServices todoServices = TodoServicesImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hex020206,
      appBar: AppBar(
        backgroundColor: AppColors.hex020206,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        title: Text(
          widget.isEdit ? 'Edit Todo' : 'Create Todo',
        ),
        leading: IconButton(
          icon: Image.asset(
            AppIcons.back,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextData(
              hintText: 'Title',
              controller: _titleController,
              height: 60,
            ),
            SizedBox(
              height: 30,
            ),
            TextData(
              hintText: 'Description',
              controller: _descriptionController,
              isMultiline: true,
              height: 120,
            ),
            SizedBox(height: 32),
            SecondButton(
                title: widget.isEdit ? 'Edit Todo' : 'Create Todo',
                onTap: () {
                  if (!widget.isEdit) {
                    final newTitle = _titleController.text;
                    final newDescription = _descriptionController.text;
                    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
                      Navigator.pop(context, {
                        'title': newTitle,
                        'description': newDescription,
                      });
                    }
                  }
                }
            ),
            if (widget.isEdit) ...[
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  // Xử lý xóa Todo
                  print('Delete Todo');
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Delete Todo',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
