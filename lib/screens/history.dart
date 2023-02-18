import 'package:calculator_app/constant/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: result.length,
                  itemBuilder: (_, int index) {
                    return Text(
                      result[index],
                      style: TextStyle(
                        fontSize: 25.sp,
                      ),
                    );
                  },
                  separatorBuilder: (_, int i) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                ),
                
                ElevatedButton(
                    onPressed: () {
                      result.clear();
                    },
                    child: const Text(
                      "Clear History",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
