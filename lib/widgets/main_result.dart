import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainResultText extends StatelessWidget {
  final String text;

  const MainResultText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: FittedBox(child: Text(text, style: TextStyle(fontSize: 50.sp))),
    );
  }
}
