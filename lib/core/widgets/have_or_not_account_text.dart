// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:doc_doc/core/themeing/colors.dart';

import '../themeing/text_style.dart';

// ignore: must_be_immutable
class HaveOrNotAnAccountText extends StatelessWidget {
  final String textPart1;
  final String textPart2;
  void Function()? onTap;

  HaveOrNotAnAccountText({
    super.key,
    required this.textPart1,
    required this.textPart2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: textPart1,
            style: AppTextStyles.inter400darkBlueColor11,
          ),
          TextSpan(
            text: textPart2,
            style: AppTextStyles.inter400darkBlueColor11
                .copyWith(color: ColorsManager.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
