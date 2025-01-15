
  import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../themeing/colors.dart';
import '../themeing/text_style.dart';
import '../utils/strings.dart';

void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: ColorsManager.errorColor,
          size: 32,
        ),
        content: Text(
          error,
          style: AppTextStyles.inter500darkBlueColor15,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              AppStrings.gotIt,
              style: AppTextStyles.inter600primaryColor14,
            ),
          ),
        ],
      ),
    );
  }