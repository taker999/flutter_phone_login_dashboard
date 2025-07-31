import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.maxLength,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.textFieldBorder.withValues(alpha: 0.7),
          width: 1.r,
        ),
      ),
      child: TextFormField(
        maxLength: maxLength,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.hintText, fontSize: 16.sp),
          border: InputBorder.none,
          errorStyle: const TextStyle(color: AppColors.white),
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 18.h),
        ),
        validator: validator,
      ),
    );
  }
}
