import 'package:doc_doc/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/strings.dart';
import '../../../core/utils/text_style.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.logo),
        SizedBox(width: 10.w),
        Text(AppStrings.appName, style: AppTextStyles.inter700blackColor24),
      ],
    );
  }
}
