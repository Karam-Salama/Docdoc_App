import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/themeing/colors.dart';
import 'package:doc_doc/core/themeing/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/funtions/error_state_fun.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validation.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/login_request_body.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';
import 'password_validations.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) => context.pushNamed(Routes.homeScreen),
          error: (error) => setupErrorState(context, error),
        );
      },
      builder: (context, state) {
        return Form(
          key: loginCubit.formKey,
          autovalidateMode: loginCubit.loginAutoValidateMode,
          child: Column(
            children: [
              //! Sign In Email
              AppTextFormField(
                hintText: AppStrings.loginEmail,
                controller: loginCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
              ),
              verticalSpace(16),
              //! Sign In Password
              AppTextFormField(
                hintText: AppStrings.loginPassword,
                obscureText: true,
                suffixIcon: true,
                controller: loginCubit.passwordController,
                keyboardType: TextInputType.text,
                validator: Validation.validatePassword,
              ),
              verticalSpace(24),
              //! Password Validations
              PasswordValidations(
                hasLowerCase: hasLowercase,
                hasUpperCase: hasUppercase,
                hasSpecialCharacters: hasSpecialCharacters,
                hasNumber: hasNumber,
                hasMinLength: hasMinLength,
              ),
              verticalSpace(24),
              //! Forgot Password
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  AppStrings.loginForgotPassword,
                  style: AppTextStyles.inter400primaryColor12,
                ),
              ),
              verticalSpace(41),
              //! Sign In Button
              state is Loading
                  ? const CircularProgressIndicator(
                      color: ColorsManager.primaryColor)
                  : CustomButton(
                      buttonText: AppStrings.login,
                      textStyle: AppTextStyles.inter600whiteColor16,
                      onPressed: () {
                        validateThenLogin(loginCubit);
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  void validateThenLogin(LoginCubit loginCubit) {
    if (loginCubit.formKey.currentState!.validate()) {
      loginCubit.formKey.currentState!.save();
      loginCubit.emitLoginStates(
        LoginRequestBody(
          email: loginCubit.emailController.text,
          password: loginCubit.passwordController.text,
        ),
      );
    } else {
      setState(() {
        loginCubit.loginAutoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
