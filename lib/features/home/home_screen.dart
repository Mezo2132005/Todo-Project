import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:todo_project/core/utls/app_constants.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/core/widgets/circle_avatar.dart';
import 'package:todo_project/features/addtask/task_add_screen.dart';
import 'package:todo_project/features/home/custom_card.dart';
import 'package:todo_project/models/task_model.dart';
import 'package:todo_project/models/user_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = Hive.box<TaskModel>(AppConstants.taskBox).values.toList();
    UserData? userData = Hive.box<UserData>(
      AppConstants.userBox,
    ).get(AppConstants.userBox);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => TaskAddScreen())); setState(() {}); }, label: Text("+ Task",style: TextStyle(fontSize: 16,color: ColorsConst.grey700),),backgroundColor: ColorsConst.blue100,),
      backgroundColor: ColorsConst.white,
      appBar: AppBar(
        toolbarHeight: 150,
        scrolledUnderElevation: 0,
        backgroundColor: ColorsConst.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: CircleAvatr(photo: userData?.img),
        ),
        leadingWidth: 90,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: 32,
              color: ColorsConst.grey700,
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(fontSize: 16.sp, color: ColorsConst.grey),
            ),
            Text(
              Hive.box<UserData>(
                AppConstants.userBox,
              ).get(AppConstants.userBox)!.user!,
              style: TextStyle(fontSize: 18.sp, color: ColorsConst.black),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: (context,index) => CustomCard(model: tasks[index],),
                itemCount: tasks.length),
            ),
          ),
        ],
      ),
    );
  }
}
