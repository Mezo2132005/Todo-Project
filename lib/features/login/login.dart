import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_project/gen/locale_keys.g.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 240, 244),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90.h,
                  width: 90.w,
                  child: CircleAvatar(radius: 2,child: Image.asset("assets/images/user.png"),),
                ),
                15.verticalSpace,
                Text(LocaleKeys.ProfileCreate.tr(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                10.verticalSpace,
                Text(LocaleKeys.AddName.tr(),style: TextStyle(fontSize: 12,color: Colors.grey),),
                25.verticalSpace,
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(LocaleKeys.FullName.tr(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    )),
                  ],
                ),
                
                10.verticalSpace,
            
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 118, 157, 234),
                      borderRadius: BorderRadiusGeometry.all(Radius.circular(25)),
                    ),
                    child: Center(child: Text(LocaleKeys.Continue.tr(),style: TextStyle(fontSize: 16,color: Colors.white),)),
                  ),
                )
              ],
            ),
            Positioned(
              right: 20,
              top: 20,
              child: IconButton(onPressed: (){
                if (context.locale.languageCode == 'en'){
                context.setLocale(Locale('ar'));
                }else{
                  context.setLocale(Locale('en'));
                }
              }, 
              icon: Icon(Icons.language,size: 40,color: const Color.fromARGB(255, 118, 157, 234),)),
            )
          ],
        ),
      ),
    );
  }
}