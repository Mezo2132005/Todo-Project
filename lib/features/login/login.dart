import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_project/gen/locale_keys.g.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ImagePicker picker = ImagePicker();

  XFile? photo;

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

                    child: CircleAvatar(
                      radius: 45.r,

                      backgroundImage: photo != null
                          ? FileImage(
                              File(photo!.path),
                            )
                          : const AssetImage(
                              "assets/images/user.png",
                            ) as ImageProvider,
                    ),
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        118,
                        157,
                        234,
                      ),

                      borderRadius: BorderRadius.circular(25.r),
                    ),

                    child: Center(
                      child: Text(
                        LocaleKeys.Continue.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
                  color: const Color.fromARGB(
                    255,
                    118,
                    157,
                    234,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
