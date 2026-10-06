import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/gen/locale_keys.g.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,

                    decoration: BoxDecoration(
                      color: ColorsConst.blue100,

                      borderRadius: BorderRadius.circular(25.r),
                    ),

                    child: Center(
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
  }
}