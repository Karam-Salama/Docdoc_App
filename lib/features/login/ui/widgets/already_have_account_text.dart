import 'package:doc_doc/core/themeing/colors.dart';
import 'package:doc_doc/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/themeing/text_style.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.alreadyHaveAccount,
            style: AppTextStyles.inter400darkBlueColor11,
          ),
          TextSpan(
            text: AppStrings.signUp,
            style: AppTextStyles.inter400darkBlueColor11
                .copyWith(color: ColorsManager.primaryColor),
            // recognizer: TapGestureRecognizer()
            //   ..onTap = () => context.navigateTo(Routes.registerScreen),
          ),
        ],
      ),
    );
  }
}
