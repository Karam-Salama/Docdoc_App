import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';

import 'widgets/login_footer_section.dart';
import 'widgets/login_form_section.dart';
import 'widgets/login_header_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const LoginHeaderSection(),
                verticalSpace(36),
                LoginFormSection(),
                verticalSpace(36),
                const LoginFooterSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


