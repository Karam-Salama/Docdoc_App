import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';
import '../../../core/themeing/colors.dart';
import '../../../core/utils/text_style.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.primaryColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        AppStrings.onBoardingGetStarted,
        style: AppTextStyles.inter600whiteColor16,
      ),
    );
  }
}
