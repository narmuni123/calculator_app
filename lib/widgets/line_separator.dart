import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2.h,
      color: Colors.white.withOpacity(0.4),
      margin: EdgeInsets.symmetric( vertical: 10.h)
    );
  }
}