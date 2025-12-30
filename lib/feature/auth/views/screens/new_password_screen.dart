import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/core/resource/widgets/custom_app_bar.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/core/resource/widgets/take_input.dart';
import 'package:meal_go/gen/assets.gen.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Enter New Password"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Image.asset(
                  Assets.images.newPasswordImage.path,
                  width: 128.w,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Create a new password to continue your Journey",
                style: AppTextStyles.textStyle14c212B36PoppinsW400.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Text(
                "Password",
                style: AppTextStyles.textStyle14c212B36PoppinsW400,
              ),
              SizedBox(height: 5.h),
              TakeInput(
                hintText: "Enter your Password",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureText: true,
              ),
              SizedBox(height: 12.h),
              Text(
                "Confirm Password",
                style: AppTextStyles.textStyle14c212B36PoppinsW400,
              ),
              SizedBox(height: 5.h),
              TakeInput(
                hintText: "Enter your Confirm Password",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureText: true,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 30.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                Assets.images.passwordUpdatedImage.path,
                                width: 120.w,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                "Password Updated",
                                style: AppTextStyles
                                    .textStylec18c212B36PoppinsW700,
                              ),
                              SizedBox(
                                child: Text(
                                  "Your password has been changed. You're all set to log in now.",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 32.h),
                              CustomButton(text: "Login"),
                            ],
                          ),
                        ),
                      );
                    },
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
