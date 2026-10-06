import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/models/task_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.model});
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsGeometry.all(10.r),
      shadowColor: ColorsConst.grey,
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16.r)),
          color: ColorsConst.pureWhite,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Container(
                height: 70.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color: Color(model.color!),
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                ),
              ),
            ),
            15.horizontalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      model.title!,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorsConst.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      model.details!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorsConst.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      alignment: AlignmentGeometry.center,
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Color.lerp(Colors.white, Color(model.color!), 0.2)!,
                        borderRadius: BorderRadiusGeometry.circular(16.r),
                      ),
                      child: Text(
                        model.status!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(model.color!),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 32,
                  color: ColorsConst.grey700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
