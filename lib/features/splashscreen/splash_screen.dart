import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_project/core/utls/app_constants.dart';
import 'package:todo_project/features/home/home_screen.dart';
import 'package:todo_project/features/login/login.dart';
import 'package:todo_project/models/user_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Hive.box<UserData>(AppConstants.userBox).isEmpty?Login() :HomeScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Lottie.asset("assets/gifs/checklist.json",repeat: false,fit: BoxFit.contain,)
            ),
          ],
        ),
      ),
    );
  }
}