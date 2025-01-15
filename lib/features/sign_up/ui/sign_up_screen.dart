import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import 'widgets/signup_footer_section.dart';
import 'widgets/signup_form_section.dart';
import 'widgets/signup_header_section.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(26),
                const SignUpHeaderSection(),
                verticalSpace(36),
                const SignUpFormSection(),
                verticalSpace(36),
                const SignUpFooterSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
