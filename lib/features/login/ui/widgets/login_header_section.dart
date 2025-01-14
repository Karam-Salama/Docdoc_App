import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themeing/text_style.dart';
import '../../../../core/utils/strings.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.loginWelcomeBack,
            style:
                AppTextStyles.inter700primaryColor32.copyWith(fontSize: 24.sp),
          ),
          verticalSpace(8),
          Text(
            AppStrings.loginSubtitle,
            style: AppTextStyles.inter400greyColor10.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
