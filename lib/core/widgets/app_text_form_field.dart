import 'package:doc_doc/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themeing/text_style.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final bool suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool? isDense;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.contentPadding,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.obscureText && _obscureText),
      keyboardType: widget.keyboardType,
      style: AppTextStyles.inter500lightGrey14
          .copyWith(color: ColorsManager.darkBlue),
      decoration: InputDecoration(
        isDense: (widget.isDense != null) ? widget.isDense : false,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        enabledBorder: getBorderStyle(color: ColorsManager.lighterGray),
        focusedBorder: getBorderStyle(color: ColorsManager.primaryColor),
        errorBorder: getBorderStyle(color: ColorsManager.errorColor),
        focusedErrorBorder: getBorderStyle(color: ColorsManager.errorColor),
        errorStyle: AppTextStyles.inter400primaryColor12.copyWith(
          color: ColorsManager.errorColor,
        ),
        hintStyle: AppTextStyles.inter500lightGrey14,
        hintText: widget.hintText,
        fillColor: ColorsManager.moreLightGray,
        filled: true,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_outlined,
                  color: ColorsManager.darkGrey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        suffixIconConstraints: (widget.isDense != null)
            ? const BoxConstraints(maxHeight: 33)
            : null,
      ),
      validator: widget.validator,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

OutlineInputBorder getBorderStyle({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: color,
      width: 1.3,
    ),
  );
}
