import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_project/core/styles/text_styles.dart';
import 'package:todo_project/core/utls/app_constants.dart';
import 'package:todo_project/core/utls/colors_const.dart';
import 'package:todo_project/core/widgets/circle_avatar.dart';
import 'package:todo_project/features/home/home_screen.dart';
import 'package:todo_project/core/widgets/custom_save_button.dart';
import 'package:todo_project/gen/locale_keys.g.dart';
import 'package:todo_project/models/user_data.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ImagePicker picker = ImagePicker();

  XFile? photo;
  final TextEditingController userController = TextEditingController();

  void saveData(XFile? selectedImage, String? user){
    Hive.box<UserData>(AppConstants.userBox).put(AppConstants.userBox, UserData(img: selectedImage?.path, user: user));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? selectedImage = await picker.pickImage(
      source: source,
    );

    if (selectedImage != null) {
      setState(() {
        photo = selectedImage;
      });
    }
  }

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

                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 130.h,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    await pickImage(
                                      ImageSource.camera,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: const Color.fromARGB(
                                      255,
                                      118,
                                      157,
                                      234,
                                    ),
                                    size: 56.sp,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () async {
                                    Navigator.pop(context);

                                    await pickImage(
                                      ImageSource.gallery,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.photo,
                                    color: const Color.fromARGB(
                                      255,
                                      118,
                                      157,
                                      234,
                                    ),
                                    size: 56.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },

                    child: CircleAvatr(photo: photo?.path)
                  ),
                ),

                15.verticalSpace,

                Text(
                  LocaleKeys.ProfileCreate.tr(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                10.verticalSpace,

                Text(
                  LocaleKeys.AddName.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),

                25.verticalSpace,

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.FullName.tr(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                10.verticalSpace,

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: TextFormField(
                    controller: userController,
                    decoration: TextStyles.style
                  ),
                ),

                GestureDetector(
                  child: CustomSaveButton(txt: LocaleKeys.Continue.tr(),),
                  onTap: () => saveData(photo, userController.text),),
              ],
            ),

            Positioned(
              right: 20.w,
              top: 20.h,
              child: IconButton(
                onPressed: () {
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(
                      const Locale('ar'),
                    );
                  } else {
                    context.setLocale(
                      const Locale('en'),
                    );
                  }
                },

                icon: Icon(
                  Icons.language,
                  size: 40.sp,
                  color: ColorsConst.blue100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
