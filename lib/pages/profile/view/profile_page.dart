import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/widgets/app_bar/common_app_bar.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(titleText: 'User information'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  // Profile Avatar
                  Container(
                    padding: EdgeInsets.only(top: 20.h),
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.imageBackground,
                    ),
                    child: Image.asset(AppImages.person),
                  ),

                  SizedBox(height: 10.h),

                  // Username
                  CustomTextWidget(
                    text: 'ByeWind',
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(height: 30.h),

                  // Information Cards
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: _buildInfoCard(
                      label: 'Serial',
                      value: '#CM9801',
                      hasChevron: false,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        _buildInfoCard(
                          label: 'Name',
                          value: 'ByeWind',
                          hasChevron: true,
                        ),
                        Divider(color: AppColors.barDark, height: 30.h),
                        _buildInfoCard(
                          label: 'Email',
                          value: 'byewind@twitter.com',
                          hasChevron: true,
                        ),
                        Divider(color: AppColors.barDark, height: 30.h),
                        _buildInfoCard(
                          label: 'Address',
                          value: 'Meadow Lane Oakland',
                          hasChevron: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: _buildInfoCard(
                      label: 'Registration date',
                      value: 'Feb 2, 2024, 8:00...',
                      hasChevron: false,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.container,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: _buildInfoCard(
                      label: 'Note',
                      value: '',
                      hasChevron: true,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Action Buttons
          Container(
            height: 100.h,
            color: AppColors.bottomNav,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.delete,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                  SizedBox(width: 40.w),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, -1.0),
                    child: Icon(
                      Icons.copy_rounded,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String label,
    required String value,
    bool hasChevron = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          CustomTextWidget(
            text: label,
            color: AppColors.white,
            fontSize: 16.sp,
          ),
          const Spacer(),
          if (value.isNotEmpty)
            CustomTextWidget(
              text: value,
              color: AppColors.textUnselectedColor,
              fontSize: 16.sp,
            ),
          if (hasChevron) ...[
            SizedBox(width: 8.w),
            Icon(Icons.chevron_right, color: AppColors.chevron, size: 20.sp),
          ],
        ],
      ),
    );
  }
}
