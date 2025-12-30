import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/core/resource/widgets/custom_app_bar.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/core/resource/widgets/take_input.dart';
import 'package:meal_go/feature/auth/views/screens/otp_verification_screen.dart';
import 'package:meal_go/gen/assets.gen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Forget Password ?"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Assets.images.forgetPasswordImage.path,
                  width: 128.w,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Don’t worry, It happens! Please enter registered Email.",
                style: AppTextStyles.textStyle14c212B36PoppinsW400.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text("Email", style: AppTextStyles.textStyle14c212B36PoppinsW400),
              SizedBox(height: 5.h),
              TakeInput(hintText: "Enter Email"),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Send OTP",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpVerificationScreen(),
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
