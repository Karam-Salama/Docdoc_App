import 'package:doc_doc/core/themeing/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validation.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginFormSection extends StatelessWidget {
  LoginFormSection({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //! Sign In Email
          const AppTextFormField(
            hintText: AppStrings.loginEmail,
            //controller: authCubit.signInEmail,
            keyboardType: TextInputType.emailAddress,
            validator: Validation.validateEmail,
          ),
          verticalSpace(16),
          //! Sign In Password
          const AppTextFormField(
            hintText: AppStrings.loginPassword,
            obscureText: true,
            suffixIcon: true,
            //controller: authCubit.signInPassword,
            keyboardType: TextInputType.text,
            validator: Validation.validatePassword,
          ),
          verticalSpace(24),
          //! Remember Me & Forgot Password
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              AppStrings.loginForgotPassword,
              style: AppTextStyles.inter400primaryColor12,
            ),
          ),
          verticalSpace(41),
          CustomButton(
            buttonText: AppStrings.login,
            textStyle: AppTextStyles.inter600whiteColor16,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (kDebugMode) {
                  print('Form is valid.');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
