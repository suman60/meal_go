import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/core/resource/widgets/custom_app_bar.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/core/resource/widgets/custom_otp_field.dart';
import 'package:meal_go/feature/auth/views/screens/new_password_screen.dart';
import 'package:meal_go/gen/assets.gen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "OTP Verification"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(14.sp),
          child: Column(
            children: [
              Image.asset(
                Assets.images.otpVerificationImage.path,
                width: 128.w,
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Please enter the 4-digit OTP",
                  style: AppTextStyles.textStyle14c212B36PoppinsW400,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(width: 250.w, child: CustomOtpField()),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Verify",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPasswordScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
