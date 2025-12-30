import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOtpField extends StatelessWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const CustomOtpField({super.key, this.length = 4, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = List.generate(
      length,
      (_) => TextEditingController(),
    );

    final List<FocusNode> focusNodes = List.generate(
      length,
      (_) => FocusNode(),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(length, (index) {
        return SizedBox(
          width: 50.w,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < length - 1) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }

              if (index == length - 1) {
                final otp = controllers.map((e) => e.text).join();
                onCompleted?.call(otp);
              }
            },
          ),
        );
      }),
    );
  }
}
