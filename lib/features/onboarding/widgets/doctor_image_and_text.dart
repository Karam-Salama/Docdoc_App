import 'package:doc_doc/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/strings.dart';
import '../../../core/themeing/text_style.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.onBoardingBackGround),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
              colors: [
                ColorsManager.whiteColor,
                ColorsManager.whiteColor.withOpacity(0.0),
              ],
            ),
          ),
          child: Image.asset(Assets.onBoardingDoctor),
        ),
        Positioned(
          bottom: 18.h,
          left: 0,
          right: 0,
          child: Text(
            AppStrings.onBoardingTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.inter700primaryColor32.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
