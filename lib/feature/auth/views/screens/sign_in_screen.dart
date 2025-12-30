import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_go/core/constants/app_colors.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/core/resource/widgets/custom_app_bar.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/core/resource/widgets/custom_checkbox.dart';
import 'package:meal_go/core/resource/widgets/take_input.dart';
import 'package:meal_go/feature/auth/controller/auth_controller.dart';
import 'package:meal_go/feature/auth/views/screens/forget_password_screen.dart';
import 'package:meal_go/feature/auth/views/screens/sign_up_screen.dart';
import 'package:meal_go/gen/assets.gen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController controller = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Login"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Hi",
                  style: AppTextStyles.textStylec24c212B36PoppinsW700,
                ),
              ),
              Align(
                child: Text(
                  "Please Enter your Details to Login ",
                  style: AppTextStyles.textStyle14c212B36PoppinsW400,
                ),
              ),

              SizedBox(height: 30.h),
              Text("Email", style: AppTextStyles.textStyle14c212B36PoppinsW400),
              SizedBox(height: 5.h),
              TakeInput(
                hintText: "mealgo@gmail.com",
                controller: emailController,
              ),
              SizedBox(height: 12.h),
              Text(
                "Password",
                style: AppTextStyles.textStyle14c212B36PoppinsW400,
              ),
              SizedBox(height: 5.h),
              TakeInput(
                controller: passwordController,
                hintText: "*******",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCheckbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    text: "Remember info",
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forget Password",
                      style: AppTextStyles.textStyle12cFF4842PoppinsW400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Obx(
                () => CustomButton(
                  text: controller.isLoading.value ? "Signing in..." : "Login",
                  backgroundColor: AppColors.c3882F6,
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
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
                    "Don’t have an account? ",
                    style: AppTextStyles.textStyle12cFF4842PoppinsW400.copyWith(
                      color: AppColors.c919EAB,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyles.textStyle12cFF4842PoppinsW400,
                    ),
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
