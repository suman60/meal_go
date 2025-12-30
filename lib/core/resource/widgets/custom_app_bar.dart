import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_go/core/constants/app_colors.dart';
import 'package:meal_go/core/constants/app_text_styles.dart';
import 'package:meal_go/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final bool needLeading;
  const CustomAppBar({
    super.key,
    this.title,
    this.action,
    this.needLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      leadingWidth: 24.w,
      leading: needLeading
          ? Transform.translate(
              offset: Offset(20, 0),
              child: Container(
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColors.black),
                ),
                child: InkWell(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                      //print("back");
                    }
                  },
                  child: Image.asset(
                    Assets.icons.backIcon.path,
                    height: 15.h,
                    width: 15.w,
                  ),
                ),
              ),
            )
          : null,

      title: Text(
        title ?? "",
        style: AppTextStyles.textStylec18c212B36PoppinsW700,
      ),

      actions: [if (action != null) action!],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
