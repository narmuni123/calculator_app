import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorButton extends StatelessWidget {
  final Color bgColor;
  final bool big;
  final String text;

  final Function onPressed;

  CalculatorButton({
    Key? key,
    bgColor,
    this.big = false,
    required this.text,
    required this.onPressed,
  })  : bgColor = bgColor ?? Color(0xff333333),
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
      margin: EdgeInsets.only(bottom: 10.h, right: 5.w, left: 5.w),
      child: TextButton(
        style: buttonStyle,
        child: SizedBox(
          width: big ? 150 : 65,
          height: 65,
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
