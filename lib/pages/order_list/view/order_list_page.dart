import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/widgets/app_bar/common_app_bar.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(titleText: 'Order List', icon: Icons.more_horiz),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          _buildOrderCard(
            orderId: '#CM9801',
            status: 'In Progress',
            statusTextColor: AppColors.inProgressText,
            statusColor: AppColors.inProgressBackground,
            userName: 'Natali Craig',
            project: 'Landing Page',
            address: 'Meadow Lane Oakland',
            date: 'Just now',
          ),
          SizedBox(height: 16.h),
          _buildOrderCard(
            orderId: '#CM9802',
            status: 'Complete',
            statusTextColor: AppColors.completeText,
            statusColor: AppColors.completeBackground,
            userName: 'Kate Morrison',
            project: 'CRM Admin pages',
            address: 'Larry San Francisco',
            date: 'A minute ago',
          ),
          SizedBox(height: 16.h),
          _buildOrderCard(
            orderId: '#CM9803',
            status: 'Pending',
            statusTextColor: AppColors.pendingText,
            statusColor: AppColors.pendingBackground,
            userName: 'Drew Cano',
            project: 'Client Project',
            address: 'Bagwell Avenue Ocala',
            date: '1 hour ago',
          ),
          SizedBox(height: 16.h),
          _buildOrderCard(
            orderId: '#CM9804',
            status: 'Approved',
            statusTextColor: AppColors.approvedText,
            statusColor: AppColors.approvedBackground,
            userName: 'Orlando Diggs',
            project: 'Admin Dashboard',
            address: 'Washburn Baton Rouge',
            date: 'Yesterday',
          ),
          SizedBox(height: 16.h),
          _buildOrderCard(
            orderId: '#CM9805',
            status: 'Rejected',
            statusTextColor: AppColors.rejectedText,
            statusColor: AppColors.rejectedBackground,
            userName: 'Andi Lane',
            project: 'App Landing Page',
            address: 'Nest Lane Olivette',
            date: 'Feb 2, 2024',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        color: AppColors.bottomNav,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Row(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    icon: Icon(Icons.menu, color: AppColors.white, size: 24.sp),
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    icon: Icon(
                      Icons.swap_vert,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.search, color: AppColors.white, size: 24.sp),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String status,
    required Color statusTextColor,
    required Color statusColor,
    required String userName,
    required String project,
    required String address,
    required String date,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          // Header with order ID and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: orderId,
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: CustomTextWidget(
                  text: status,
                  color: statusTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4.w,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // User row
          _buildDetailRow(label: 'User', value: userName, hasAvatar: true),

          const Divider(color: AppColors.barDark),

          // Project row
          _buildDetailRow(label: 'Project', value: project),

          const Divider(color: AppColors.barDark),

          // Address row
          _buildDetailRow(label: 'Address', value: address),

          const Divider(color: AppColors.barDark),

          // Date row
          _buildDetailRow(label: 'Date', value: date),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    bool hasAvatar = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: label,
          color: AppColors.textUnselectedColor,
          fontSize: 12.sp,
          letterSpacing: 0.4.w,
        ),
        Row(
          children: [
            if (hasAvatar) ...[
              CircleAvatar(
                radius: 12.r,
                backgroundColor: AppColors.imageBackground,
                backgroundImage: const AssetImage(AppImages.person),
              ),
              SizedBox(width: 8.w),
            ],
            CustomTextWidget(
              text: value,
              color: AppColors.white,
              fontSize: 12.sp,
              letterSpacing: 0.4.w,
            ),
          ],
        ),
      ],
    );
  }
}
