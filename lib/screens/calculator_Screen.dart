import 'package:calculator_app/constant/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  @override
  void initState() {
    getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode Demo'),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                    () => Text(
                  'Click on switch to change to ${isLightTheme.value ? 'Dark' : 'Light'} theme',
                ),
              ),
              ObxValue(
                    (data) => Switch(
                  value: isLightTheme.value,
                  onChanged: (val) {
                    isLightTheme.value = val;
                    Get.changeThemeMode(
                      isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                    );
                    saveThemeStatus();
                  },
                ),
                false.obs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
