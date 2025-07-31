import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing ?? 0,
      ),
    );
  }
}
