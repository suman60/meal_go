import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          Container(
            height: 12.h,
            width: 15.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: value ? Colors.grey : Colors.transparent,
            ),
            child: value
                ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                : null,
          ),
          SizedBox(width: 10.w),
          Text(text),
        ],
      ),
    );
  }
}
