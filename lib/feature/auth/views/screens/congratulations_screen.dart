import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/resource/widgets/custom_button.dart';
import 'package:meal_go/gen/assets.gen.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.congratulationsImage.path,
                width: double.infinity,
              ),

              CustomButton(text: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
