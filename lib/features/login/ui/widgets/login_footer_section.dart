import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import 'already_have_account_text.dart';
import 'terms_and_conditions_text.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const TermsAndConditionsText(),
          verticalSpace(36),
          const AlreadyHaveAnAccountText(),
        ],
      ),
    );
  }
}