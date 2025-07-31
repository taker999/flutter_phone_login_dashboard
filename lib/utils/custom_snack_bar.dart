import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_colors.dart';
import 'widgets/texts/custom_text_widget.dart';

class CustomSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomTextWidget(text: message, color: AppColors.white),
        backgroundColor:
            isError
                ? AppColors.rejectedBackground
                : AppColors.approvedBackground,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        margin: EdgeInsets.all(16.r),
      ),
    );
  }
}
