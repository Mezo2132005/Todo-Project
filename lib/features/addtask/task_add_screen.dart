import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:todo_project/core/styles/text_styles.dart';
import 'package:todo_project/core/utls/app_constants.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/core/widgets/custom_save_button.dart';
import 'package:todo_project/features/addtask/color_picker.dart';
import 'package:todo_project/models/task_model.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  Color selectedColor = Colors.red;
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.white,
      appBar: AppBar(
        backgroundColor: ColorsConst.white,
        scrolledUnderElevation: 0,
        title: Text(
          "Add Task",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.normal),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              "Add Task",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            TextFormField(
              controller: titleController,
              decoration: TextStyles.titleStyle,
            ),

            Text(
              "Description",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              minLines: 6,
              textAlignVertical: TextAlignVertical.top,
              decoration: TextStyles.detalsStyle,
            ),

            Text(
              "Status",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),

            DropdownButtonFormField<String>(
              value: statusController.text.isEmpty
                  ? null
                  : statusController.text,
              decoration: TextStyles.stateStyle,
              hint: const Text("Choose Status"),
              items: const [
                DropdownMenuItem(value: "Bending", child: Text("Bending")),
                DropdownMenuItem(value: "Done", child: Text("Done")),
                DropdownMenuItem(
                  value: "In Progress",
                  child: Text("In Progress"),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    statusController.text = value;
                  });
                }
              },
            ),

            Text(
              "Choose Color",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            ColorPicker(
              onColorSelected: (color) {
                selectedColor = color;
              },
            ),
            GestureDetector(
              child: CustomSaveButton(txt: 'Save Task'),
              onTap: () {
                Hive.box<TaskModel>(AppConstants.taskBox).add(
                  TaskModel(
                    title: titleController.text,
                    details: descriptionController.text,
                    color: selectedColor.toARGB32(),
                    status: statusController.text,
                    date: "date",
                    time: "time",
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
