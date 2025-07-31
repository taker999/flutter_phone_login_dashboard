import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts/custom_text_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key, required this.titleText, this.isHomeVisible, this.icon});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String titleText;
  final IconData? icon;
  final bool? isHomeVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios, color: AppColors.blue, size: 24.sp),
              isHomeVisible != null ? CustomTextWidget(
                text: 'Home',
                color: AppColors.blue,
                fontSize: 16.sp,
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      leadingWidth: 120.w,
      centerTitle: true,
      title: CustomTextWidget(
        text: titleText,
        color: AppColors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      actions: [
        if (icon != null) ...[
          IconButton(
            onPressed: () {},
            icon: Icon(icon, size: 24.sp),
            color: AppColors.blue,
          ),
          SizedBox(width: 2.w),
        ],
      ],
    );
  }
}
