import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/have_or_not_account_text.dart';
import '../../../../core/widgets/terms_and_conditions_text.dart';

class SignUpFooterSection extends StatelessWidget {
  const SignUpFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const TermsAndConditionsText(),
          verticalSpace(36),
          HaveOrNotAnAccountText(
            textPart1: AppStrings.alreadyHaveAccount,
            textPart2: AppStrings.signIn,
            onTap: () {
              context.pushNamed(Routes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
