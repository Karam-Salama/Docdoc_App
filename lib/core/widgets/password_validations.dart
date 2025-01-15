import 'package:doc_doc/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../themeing/colors.dart';
import '../themeing/text_style.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(AppStrings.lowerLetterRequired, hasLowerCase),
        verticalSpace(2),
        buildValidationRow(AppStrings.upperLetterRequired, hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            AppStrings.specialCharacterRequired, hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow(AppStrings.numberRequired, hasNumber),
        verticalSpace(2),
        buildValidationRow(AppStrings.minLengthRequired, hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.greyColor,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: AppTextStyles.inter400darkBlueColor11.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorsManager.primaryColor,
            decorationThickness: 2,
            color:
                hasValidated ? ColorsManager.greyColor : ColorsManager.darkBlue,
          ),
        )
      ],
    );
  }
}
