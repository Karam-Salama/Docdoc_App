import 'package:flutter/material.dart';

import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_style.dart';
import '../../../../core/utils/strings.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.termsAndConditionsPart1,
            style: AppTextStyles.inter400textFormFieldInputColor11
                .copyWith(color: ColorsManager.textFormFieldSuffixIconColor),
          ),
          TextSpan(
            text: AppStrings.termsAndConditionsPart2,
            style: AppTextStyles.inter400textFormFieldInputColor11,
          ),
          TextSpan(
            text: AppStrings.termsAndConditionsPart3,
            style: AppTextStyles.inter400textFormFieldInputColor11
                .copyWith(color: ColorsManager.textFormFieldSuffixIconColor),
          ),
          TextSpan(
            text: AppStrings.termsAndConditionsPart4,
            style: AppTextStyles.inter400textFormFieldInputColor11,
          ),
        ],
      ),
    );
  }
}
