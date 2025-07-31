import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/custom_snack_bar.dart';
import '../../../utils/widgets/buttons/custom_text_button.dart';
import '../../../utils/widgets/inputs/custom_text_form_field.dart';
import '../../../utils/widgets/texts/custom_text_widget.dart';
import '../../auth/model/auth_state.dart';
import '../../auth/provider/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes and show snack-bars
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.error != null) {
        CustomSnackBar.show(
          context: context,
          message: next.error!,
          isError: true,
        );
      } else if (next.isOtpSent && (previous?.isOtpSent != true)) {
        CustomSnackBar.show(context: context, message: 'Your OTP is 654321');
      } else if (next.user != null && previous?.user == null) {
        CustomSnackBar.show(context: context, message: 'Login successful!');
      }
    });

    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.w,
              right: 40.w,
              top: 150.h,
              bottom: 75.h,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    // ChatGPT Logo
                    SvgPicture.asset(
                      AppImages.chatgptLogo,
                      width: 90.w,
                      height: 90.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // ChatGPT Text
                    CustomTextWidget(
                      text: 'ChatGPT',
                      color: AppColors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ],
                ),
                SizedBox(height: 130.h),
                Column(
                  children: [
                    // Social login buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSocialButton(
                          icon: AppImages.googleLogo,
                          color: AppColors.googleButton,
                        ),
                        SizedBox(width: 10.w),
                        _buildSocialButton(
                          icon: AppImages.appleLogo,
                          color: AppColors.appleButton,
                        ),
                        SizedBox(width: 10.w),
                        _buildSocialButton(
                          icon: AppImages.facebookLogo,
                          color: AppColors.facebookButton,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(
                      color: AppColors.divider.withValues(alpha: 0.7),
                      thickness: 1.1.h,
                    ),
                    SizedBox(height: 20.h),

                    Consumer(
                      builder: (context, ref, child) {
                        final authState = ref.watch(authProvider);

                        return Column(
                          children: [
                            // Phone number input or OTP input
                            !authState.isOtpSent
                                ? CustomTextFormField(
                                  controller: _phoneController,
                                  maxLength: 10,
                                  hintText: 'Email or Phone Number',
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Phone number is required';
                                    }

                                    final phoneRegex = RegExp(r'^[6-9]\d{9}$');
                                    if (!phoneRegex.hasMatch(value.trim())) {
                                      return 'Enter a valid 10-digit phone number';
                                    }
                                    return null;
                                  },
                                )
                                :
                                // OTP input
                                CustomTextFormField(
                                  controller: _otpController,
                                  maxLength: 6,
                                  hintText: 'Enter OTP',
                                ),

                            SizedBox(height: 15.h),
                            // Main action button
                            Container(
                              width: double.infinity,
                              height: 56.h,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: CustomTextButton(
                                onPressed:
                                    authState.isLoading
                                        ? null
                                        : () {
                                          if (!authState.isOtpSent) {
                                            if (_phoneController.text
                                                    .trim()
                                                    .length !=
                                                10) {
                                              CustomSnackBar.show(
                                                context: context,
                                                message:
                                                    'Please enter a valid phone number',
                                                isError: true,
                                              );
                                              return;
                                            }
                                            if (_phoneController.text
                                                .trim()
                                                .isEmpty) {
                                              CustomSnackBar.show(
                                                context: context,
                                                message:
                                                    'Please enter phone number',
                                                isError: true,
                                              );
                                              return;
                                            }
                                            ref
                                                .read(authProvider.notifier)
                                                .sendOtp(
                                                  _phoneController.text.trim(),
                                                );
                                          } else {
                                            if (_otpController.text
                                                .trim()
                                                .isEmpty) {
                                              CustomSnackBar.show(
                                                context: context,
                                                message: 'Please enter OTP',
                                                isError: true,
                                              );
                                              return;
                                            }
                                            ref
                                                .read(authProvider.notifier)
                                                .verifyOtp(
                                                  _otpController.text.trim(),
                                                );
                                          }
                                        },
                                child:
                                    authState.isLoading
                                        ? SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator(
                                            color: AppColors.white,
                                            strokeWidth: 2.r,
                                          ),
                                        )
                                        : CustomTextWidget(
                                          text:
                                              authState.isOtpSent
                                                  ? 'Verify OTP'
                                                  : 'Sign In or Sign Up',
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                          letterSpacing: 0.4.w,
                                        ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    // Footer links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          onPressed: () {},
                          text: 'Forgot Password',
                        ),
                        CustomTextButton(onPressed: () {}, text: 'Contact Us'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String icon, required Color color}) {
    return Expanded(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
