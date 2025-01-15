import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/funtions/error_state_fun.dart';
import '../../../../core/funtions/succ_state_fun.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validation.dart';
import '../../../../core/themeing/colors.dart';
import '../../../../core/themeing/text_style.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/password_validations.dart';
import '../../logic/cubit/signup_cubit.dart';
import '../../logic/cubit/signup_state.dart';

class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
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
        hasMinLength = AppRegex.passHasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SignupCubit signUpCubit = BlocProvider.of<SignupCubit>(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          signupSuccess: (loginResponse) => showSuccessDialog(context),
          signupError: (error) => setupErrorState(context, error),
        );
      },
      builder: (context, state) {
        return Form(
          key: signUpCubit.formKey,
          autovalidateMode: signUpCubit.loginAutoValidateMode,
          child: Column(
            children: [
              //! Sign Up Name
              AppTextFormField(
                hintText: AppStrings.name,
                controller: signUpCubit.nameController,
                keyboardType: TextInputType.text,
                validator: Validation.validateName,
              ),
              verticalSpace(16),
              //! Sign Up Phone
              AppTextFormField(
                hintText: AppStrings.phone,
                controller: signUpCubit.phoneController,
                keyboardType: TextInputType.number,
                validator: Validation.validatePhone,
              ),
              verticalSpace(16),
              //! Sign Up Email
              AppTextFormField(
                hintText: AppStrings.email,
                controller: signUpCubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validation.validateEmail,
              ),
              verticalSpace(16),
              //! Sign In Password
              AppTextFormField(
                hintText: AppStrings.password,
                obscureText: true,
                suffixIcon: true,
                controller: signUpCubit.passwordController,
                keyboardType: TextInputType.text,
                validator: Validation.validatePassword,
              ),
              verticalSpace(16),
              //! Sign In Confirm Password
              AppTextFormField(
                hintText: AppStrings.confirmPassword,
                obscureText: true,
                suffixIcon: true,
                controller: signUpCubit.passwordConfirmationController,
                keyboardType: TextInputType.text,
                validator: (value) => Validation.validateConfirmPassword(
                  value,
                  signUpCubit.passwordController.text,
                ),
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
              //! Sign In Button
              state is SignupLoading
                  ? const CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    )
                  : CustomButton(
                      buttonText: AppStrings.signUpCreateAccount,
                      textStyle: AppTextStyles.inter600whiteColor16,
                      onPressed: () {
                        validateThenSignUp(signUpCubit);
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  void validateThenSignUp(SignupCubit signUpCubit) {
    if (signUpCubit.formKey.currentState!.validate()) {
      signUpCubit.formKey.currentState!.save();
      signUpCubit.emitSignupStates();
    } else {
      setState(() {
        signUpCubit.loginAutoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
