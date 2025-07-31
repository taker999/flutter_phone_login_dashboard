import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: 'Projects',
            color: AppColors.projectText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3.w,
          ),

          SizedBox(height: 20.h),

          // Project Items
          _buildProjectItem(
            name: 'ByeWind',
            status: 'In Progress',
            backGroundColor: AppColors.background,
            statusTextColor: AppColors.inProgressText,
            statusColor: AppColors.inProgressBackground,
          ),
          _buildProjectItem(
            name: 'Natali Craig',
            status: 'Complete',
            backGroundColor: AppColors.projectItemLight,
            statusTextColor: AppColors.completeText,
            statusColor: AppColors.completeBackground,
          ),
          _buildProjectItem(
            name: 'Drew Cano',
            status: 'Pending',
            backGroundColor: AppColors.background,
            statusTextColor: AppColors.pendingText,
            statusColor: AppColors.pendingBackground,
          ),
          _buildProjectItem(
            name: 'Orlando Diggs',
            status: 'Approved',
            backGroundColor: AppColors.projectItemLight,
            statusTextColor: AppColors.approvedText,
            statusColor: AppColors.approvedBackground,
          ),
          _buildProjectItem(
            name: 'Andi Lane',
            status: 'Rejected',
            backGroundColor: AppColors.background,
            statusTextColor: AppColors.rejectedText,
            statusColor: AppColors.rejectedBackground,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem({
    required String name,
    required String status,
    required Color backGroundColor,
    required Color statusTextColor,
    required Color statusColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            child: Icon(Icons.person, color: AppColors.white, size: 16.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomTextWidget(
              text: name,
              color: AppColors.white,
              fontSize: 14.sp,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CustomTextWidget(
              text: status,
              color: statusTextColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
