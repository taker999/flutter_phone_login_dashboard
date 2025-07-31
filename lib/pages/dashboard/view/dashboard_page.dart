import 'package:flutter/material.dart';
import 'package:flutter_login_dashboard/pages/dashboard/view/product_traffic_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_routes/route_names.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/widgets/app_bar/common_app_bar.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';
import '../model/bar_data.dart';
import 'line_chart_card.dart';
import 'projects_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(titleText: 'OverView', isHomeVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Cards Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: (160.w / 100.h),
              children: [
                _buildStatCard(
                  title: 'Views',
                  value: '7,265',
                  change: '+11.01%',
                  isPositive: true,
                  bgColorLight: AppColors.cardBackgroundBlueBottom,
                  bgColorDark: AppColors.cardBackgroundBlueTop,
                ),
                _buildStatCard(
                  title: 'Visits',
                  value: '3,671',
                  change: '-0.03%',
                  isPositive: false,
                  bgColorLight: AppColors.cardBackgroundBlackBottom,
                  bgColorDark: AppColors.cardBackgroundBlackTop,
                ),
                _buildStatCard(
                  title: 'New Users',
                  value: '256',
                  change: '+15.03%',
                  isPositive: true,
                  bgColorLight: AppColors.cardBackgroundBlackBottom,
                  bgColorDark: AppColors.cardBackgroundBlackTop,
                ),
                _buildStatCard(
                  title: 'Active Users',
                  value: '2,318',
                  change: '+6.08%',
                  isPositive: true,
                  bgColorLight: AppColors.cardBackgroundBlueBottom,
                  bgColorDark: AppColors.cardBackgroundBlueTop,
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Line Chart
            const LineChartCard(),

            SizedBox(height: 16.h),

            // Device Traffic
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.container,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Device Traffic',
                    color: AppColors.blue,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3.w,
                  ),
                  SizedBox(height: 20.h),
                  _buildBarChart([
                    BarData('Linux', 60.h),
                    BarData('Mac', 110.h),
                    BarData('iOS', 80.h),
                    BarData('Windows', 120.h),
                    BarData('Android', 85.h),
                    BarData('Other', 70.h),
                  ]),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Location Traffic
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.container,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Location Traffic',
                    color: AppColors.locationTrafficText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3.w,
                  ),
                  SizedBox(height: 20.h),
                  _buildBarChart([
                    BarData('US', 60.h),
                    BarData('Canada', 110.h),
                    BarData('Mexico', 90.h),
                    BarData('China', 50.h),
                    BarData('Japan', 120.h),
                    BarData('Australia', 80.h),
                  ]),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Product Traffic
            const ProductTrafficCard(),

            SizedBox(height: 16.h),

            // Projects Section
            const ProjectsCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: const BoxDecoration(color: AppColors.bottomNav),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavItem(context, Icons.home, 0),
            _buildBottomNavItem(context, Icons.refresh, 1),
            _buildBottomNavItem(context, Icons.notifications_outlined, 2),
            _buildBottomNavItem(context, Icons.settings_outlined, 3),
            _buildBottomNavItem(context, Icons.person_2, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 3) {
          Navigator.pushNamed(context, RouteNames.orderList);
        } else if (index == 4) {
          Navigator.pushNamed(context, RouteNames.profile);
        }
      },
      child:
          index == 4
              ? Container(
            padding: EdgeInsets.only(top: 6.h),
                width: 26.w,
                height: 26.h,
                decoration: const BoxDecoration(
                  color: AppColors.imageBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.black, size: 24.sp),
              )
              : Container(
                padding: EdgeInsets.all(8.r),
                child: Icon(icon, color: AppColors.white, size: 24.sp),
              ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String change,
    required bool isPositive,
    required Color bgColorLight,
    required Color bgColorDark,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [bgColorDark, bgColorLight],
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: title,
                color: AppColors.white,
                fontSize: 15.sp,
              ),
              Container(
                width: 40.w,
                height: 35.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.1),
                    width: 1.r,
                  ),
                  color: AppColors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withValues(alpha: 0.1),
                      blurRadius: 0,
                      offset: Offset(-1.w, -1.h),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child:
                    isPositive
                        ? const Icon(Icons.trending_up, color: AppColors.white)
                        : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0),
                          child: const Icon(
                            Icons.trending_down,
                            color: AppColors.white,
                          ),
                        ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: value,
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              CustomTextWidget(
                text: change,
                color: AppColors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(List<BarData> data) {
    return SizedBox(
      height: 150.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: data.map((item) => _buildBar(item)).toList(),
      ),
    );
  }

  Widget _buildBar(BarData data) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (data.label.toLowerCase() == 'android') ...[
                Container(
                  width: 50.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.barValueDark, AppColors.barValueLight],
                    ),
                  ),
                  child: const CustomTextWidget(text: '243K', color: AppColors.white),
                ),
                SizedBox(height: 6.h),
              ],
              SizedBox(
                width: 50.w,
                child: Column(
                  children: [
                    Container(
                      width: 40.w,
                      height: data.height,
                      decoration: BoxDecoration(
                        color: AppColors.barDark,
                        borderRadius: BorderRadius.circular(12.r),
                        gradient:
                            data.label.toLowerCase() == 'android'
                                ? const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.barBlueDark,
                                    AppColors.barBlueLight,
                                  ],
                                )
                                : null,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextWidget(
                      text: data.label,
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
