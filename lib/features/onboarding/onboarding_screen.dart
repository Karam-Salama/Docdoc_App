// ignore_for_file: file_names

import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routing/routes.dart';
import '../../core/utils/strings.dart';
import '../../core/themeing/text_style.dart';
import '../../core/widgets/custom_button.dart';
import 'widgets/doc_logo_and_name.dart';
import 'widgets/doctor_image_and_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 30.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      AppStrings.onBoardingSubtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.inter400greyColor10,
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      buttonText: AppStrings.onBoardingGetStarted,
                      textStyle: AppTextStyles.inter600whiteColor16,
                      onPressed: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
