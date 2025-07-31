import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../texts/custom_text_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.text, this.child, this.onPressed});

  final String? text;
  final Widget? child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:
          text != null
              ? CustomTextWidget(
                text: text.toString(),
                color: AppColors.white,
              )
              : child!,
    );
  }
}
