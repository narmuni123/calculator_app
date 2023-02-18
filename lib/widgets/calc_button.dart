import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorButton extends StatelessWidget {
  final Color bgColor;
  final bool big;
  final String text;

  final Function onPressed;

  const CalculatorButton({
    Key? key,
    bgColor,
    this.big = false,
    required this.text,
    required this.onPressed,
  })  : bgColor = bgColor ?? Colors.black12,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Button
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: bgColor,
      primary: Colors.white,
      shape: const StadiumBorder(),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 2.h, right: 4.w, left: 4.w),
      child: TextButton(
        style: buttonStyle,
        child: SizedBox(
          width: 65.w,
          height: 65.h,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w300),
          )),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
