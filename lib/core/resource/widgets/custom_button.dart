import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/constants/app_colors.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final Color? borderColor;
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.height,
    this.width,
    this.suffixIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cD0D5DD, width: 1.w),
          color: backgroundColor ?? AppColors.c3882F6,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (suffixIcon != null) ...[suffixIcon!, SizedBox(width: 10.w)],
            Text(
              text ?? "Login",
              style: AppTextStyles.textStyle18cFFFFFFPoppinsW500.copyWith(
                color: textColor ?? AppColors.cFFFFFF,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
