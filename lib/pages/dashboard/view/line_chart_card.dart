import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.container,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          // Tabs
          Row(
            children: [
              _buildTab(title: 'Users', isSelected: true),
              SizedBox(width: 18.w),
              _buildTab(title: 'Projects', isSelected: false),
              SizedBox(width: 18.w),
              _buildTab(title: 'Operating Status', isSelected: false),
            ],
          ),

          SizedBox(height: 20.h),

          // Line Chart
          SizedBox(
            height: 150.h,
            child: Column(
              children: [
                Expanded(
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 7,
                      minY: 1,
                      maxY: 4.5,
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      extraLinesData: ExtraLinesData(
                        verticalLines: [
                          _verticalLine(x: 0.5, lineStart: 0.4),
                          _verticalLine(x: 1.7, lineStart: 0.7),
                          _verticalLine(x: 2.9, lineStart: 0.5),
                          _verticalLine(x: 4.1, lineStart: 0.1),
                          _verticalLine(x: 5.2, lineStart: 0.1),
                          _verticalLine(x: 6.4, lineStart: 0.1),
                        ],
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 2),
                            FlSpot(0.5, 2.5),
                            FlSpot(1, 1.3),
                            FlSpot(1.5, 1.7),
                            FlSpot(1.7, 1.5),
                            FlSpot(2.5, 2.5),
                            FlSpot(2.9, 2.3),
                            FlSpot(3.3, 2.6),
                            FlSpot(3.7, 3.5),
                            FlSpot(4.1, 3.3),
                            FlSpot(4.6, 4.0),
                            FlSpot(4.9, 2.7),
                            FlSpot(5.2, 3),
                            FlSpot(5.4, 3.3),
                            FlSpot(5.7, 2.3),
                            FlSpot(6.4, 3.3),
                            FlSpot(7, 3.5),
                          ],
                          isCurved: true,
                          curveSmoothness: 0.1,
                          color: AppColors.chartLine,
                          barWidth: 1.5.r,
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, barData) {
                              // Show dots only for specific points
                              return spot.x == 0.5 ||
                                  spot.x == 1.7 ||
                                  spot.x == 2.9 ||
                                  spot.x == 4.1 ||
                                  spot.x == 5.2 ||
                                  spot.x == 6.4;
                            },
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 2.r,
                                color: AppColors.white,
                                strokeWidth: 2.r,
                                strokeColor: AppColors.black,
                              );
                            },
                          ),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                      backgroundColor: AppColors.transparent,
                    ),
                  ),
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

  VerticalLine _verticalLine({required double x, required double lineStart}) {
    return VerticalLine(
      x: x,
      color: AppColors.transparent, // Make the line transparent
      strokeWidth: 1.r,
      // Use a gradient shader instead
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.transparent, AppColors.white.withValues(alpha: 0.1)],
        stops: [lineStart, 1], // Start showing line from 40% down
      ),
    );
  }

  Widget _buildTab({required String title, required bool isSelected}) {
    return CustomTextWidget(
      text: title,
      color:
          isSelected
              ? AppColors.textSelectedColor
              : AppColors.textUnselectedColor,
      fontSize: 16.sp,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      letterSpacing: 0.3.w,
    );
  }
}
