import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';
import '../themeing/text_style.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(AppStrings.signupSuccess),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                AppStrings.signupSuccessMessage,
                style: AppTextStyles.inter500darkBlueColor15,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(AppStrings.signupContinue,
                style: AppTextStyles.inter600primaryColor14),
          ),
        ],
      );
    },
  );
}
