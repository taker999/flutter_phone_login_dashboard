import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';

class ProductTrafficCard extends StatelessWidget {
  const ProductTrafficCard({super.key});

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
            text: 'Product Traffic',
            color: AppColors.productTrafficText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3.w,
          ),

          SizedBox(height: 15.h),

          // Legend
          Row(
            children: [
              _buildLegendItem('All', AppColors.white),
              SizedBox(width: 20.w),
              _buildLegendItem('SnapUI', AppColors.productTrafficBarGreyDark),
              SizedBox(width: 20.w),
              _buildLegendItem('Dashboard', AppColors.productTrafficBarRed),
            ],
          ),

          SizedBox(height: 5.h),

          // Product Traffic Chart
          SizedBox(
            height: 150.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildProductTrafficBar(
                      redLineHeight: 25.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 60.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 30.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 70.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 20.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 40.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 15.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 30.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 60.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 15.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 30.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 15.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 70.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 15.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 20.h,
                      greyLineHeight: 15.h,
                      gradientLineHeight: 10.h,
                    ),
                    _buildProductTrafficBar(
                      redLineHeight: 40.h,
                      greyLineHeight: 20.h,
                      gradientLineHeight: 15.h,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextWidget(text: 'Jan', color: AppColors.white),
                    CustomTextWidget(text: 'Feb', color: AppColors.white),
                    CustomTextWidget(text: 'Mar', color: AppColors.white),
                    CustomTextWidget(text: 'Apr', color: AppColors.white),
                    CustomTextWidget(text: 'May', color: AppColors.white),
                    CustomTextWidget(text: 'Jun', color: AppColors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6.w),
        CustomTextWidget(text: label, color: AppColors.white, fontSize: 12.sp),
      ],
    );
  }

  Widget _buildProductTrafficBar({
    required double redLineHeight,
    required double greyLineHeight,
    required double gradientLineHeight,
  }) {
    return Column(
      children: [
        Container(
          width: 2.w,
          height: gradientLineHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.productTrafficBarGreyLight,
                AppColors.productTrafficBarGreyDark,
              ],
            ),
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          width: 2.w,
          height: greyLineHeight,
          color: AppColors.productTrafficBarGreyDark,
        ),
        SizedBox(height: 2.h),
        Container(
          width: 2.w,
          height: redLineHeight,
          color: AppColors.productTrafficBarRed,
        ),
      ],
    );
  }
}
