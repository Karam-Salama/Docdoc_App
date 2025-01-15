import 'package:doc_doc/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle inter700blackColor24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackColor,
  );

  static TextStyle inter500darkBlueColor15 = TextStyle(
    fontSize: 15.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
    color: ColorsManager.darkBlue,
  );

  static TextStyle inter400darkBlueColor11 = TextStyle(
    fontSize: 11.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: ColorsManager.darkBlue,
  );

  static TextStyle inter700primaryColor32 = TextStyle(
    fontSize: 32.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w700,
    color: ColorsManager.primaryColor,
  );

  static TextStyle inter600primaryColor14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryColor,
  );

  static TextStyle inter400primaryColor12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: ColorsManager.primaryColor,
  );

  static TextStyle inter400greyColor10 = TextStyle(
    fontSize: 10.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: ColorsManager.greyColor,
  );

  static TextStyle inter500lightGrey14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w500,
    color: ColorsManager.lightGrey,
  );

  static TextStyle inter600whiteColor16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    color: ColorsManager.whiteColor,
  );
}
