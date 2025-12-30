import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:meal_go/core/constants/app_colors.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/core/resource/widgets/custom_app_bar.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/core/resource/widgets/custom_checkbox.dart';
import 'package:meal_go/core/resource/widgets/take_input.dart';
import 'package:meal_go/feature/auth/controller/auth_controller.dart';
import 'package:meal_go/feature/auth/views/screens/congratulations_screen.dart';
import 'package:meal_go/gen/assets.gen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Define controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController controller = Get.find();
  bool isLoading = false;

  // Dispose them to prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Create Account"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Hi, Create New Account",
                  style: AppTextStyles.textStylec24c212B36PoppinsW700,
                ),
              ),
              Align(
                child: Text(
                  "Please Enter your Details to  Create Account",
                  style: AppTextStyles.textStyle14c212B36PoppinsW400,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Full Name",
                style: AppTextStyles.textStyle14c212B36PoppinsW400,
              ),
              SizedBox(height: 5.h),
              TakeInput(
                hintText: "Enter Your Full Name",
                controller: _nameController,
              ),
              SizedBox(height: 12.h),
              //SizedBox(height: 30.h),
              Text("Email", style: AppTextStyles.textStyle14c212B36PoppinsW400),
              SizedBox(height: 5.h),
              TakeInput(hintText: "Enter Email", controller: _emailController),
              SizedBox(height: 12.h),
              Text(
                "Password",
                style: AppTextStyles.textStyle14c212B36PoppinsW400,
              ),
              SizedBox(height: 5.h),
              TakeInput(
                controller: _passwordController,
                hintText: "*******",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureText: true,
              ),
              //SizedBox(height: 16.h),
              SizedBox(height: 24.h),
              Obx(
                () => CustomButton(
                  text: controller.isLoading.value
                      ? "Creating account..."
                      : "Sign Up",
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.signUp(
                            fullName: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        },
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1.h, color: AppColors.c919EAB),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Or continue with",
                    style: AppTextStyles.textStyle14c919EABPoppinsW400,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(height: 1.h, color: AppColors.c919EAB),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: "Sign in with Google",
                backgroundColor: AppColors.cFFFFFF,
                textColor: AppColors.c344054,
                suffixIcon: Image.asset(
                  Assets.icons.googleIcon.path,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyles.textStyle12cFF4842PoppinsW400.copyWith(
                      color: AppColors.c919EAB,
                    ),
                  ),
                  Text(
                    "Sign In",
                    style: AppTextStyles.textStyle12cFF4842PoppinsW400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
