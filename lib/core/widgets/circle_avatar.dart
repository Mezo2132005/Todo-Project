import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatr extends StatelessWidget {
  const CircleAvatr({super.key, required this.photo});
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
                      radius: 45.r,

                      backgroundImage: photo != null
                          ? FileImage(
                              File(photo!),
                            )
                          : const AssetImage(
                              "assets/images/user.png",
                            ) as ImageProvider,
                    );
  }
}