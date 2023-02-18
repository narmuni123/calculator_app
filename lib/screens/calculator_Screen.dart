import 'package:calculator_app/constant/prefs.dart';
import 'package:calculator_app/screens/history.dart';
import 'package:calculator_app/services/calculator_services.dart';
import 'package:calculator_app/widgets/calc_button.dart';
import 'package:calculator_app/widgets/math_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final calculatorCtrl = Get.put(CalculatorController());

  @override
  void initState() {
    getThemeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
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
        body: SafeArea(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(),
                ),
                MathResults(),
                GestureDetector(
                  onTap: (){
                    Get.to(const HistoryScreen());
                  },
                  child: Icon(Icons.history),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: 'C',
                      bgColor: Colors.black12,
                      onPressed: () => calculatorCtrl.resetAll(),
                    ),
                    CalculatorButton(
                      text: 'del',
                      bgColor: Colors.black12,
                      onPressed: () => calculatorCtrl.deletedLastEntry(),
                    ),
                    CalculatorButton(
                      text: '%',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.selectOperation('%'),
                    ),
                    CalculatorButton(
                      text: '/',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.selectOperation('/'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '7',
                      onPressed: () => calculatorCtrl.addNumber('7'),
                    ),
                    CalculatorButton(
                      text: '8',
                      onPressed: () => calculatorCtrl.addNumber('8'),
                    ),
                    CalculatorButton(
                      text: '9',
                      onPressed: () => calculatorCtrl.addNumber('9'),
                    ),
                    CalculatorButton(
                      text: 'x',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.selectOperation('x'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '4',
                      onPressed: () => calculatorCtrl.addNumber('4'),
                    ),
                    CalculatorButton(
                      text: '5',
                      onPressed: () => calculatorCtrl.addNumber('5'),
                    ),
                    CalculatorButton(
                      text: '6',
                      onPressed: () => calculatorCtrl.addNumber('6'),
                    ),
                    CalculatorButton(
                      text: '-',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.selectOperation('-'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '1',
                      onPressed: () => calculatorCtrl.addNumber('1'),
                    ),
                    CalculatorButton(
                      text: '2',
                      onPressed: () => calculatorCtrl.addNumber('2'),
                    ),
                    CalculatorButton(
                      text: '3',
                      onPressed: () => calculatorCtrl.addNumber('3'),
                    ),
                    CalculatorButton(
                      text: '+',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.selectOperation('+'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalculatorButton(
                      text: '+/-',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.changeNegativePositive(),
                    ),
                    CalculatorButton(
                      text: '0',
                      big: false,
                      onPressed: () => calculatorCtrl.addNumber('0'),
                    ),
                    CalculatorButton(
                      text: '.',
                      onPressed: () => calculatorCtrl.addDecimalPoint(),
                    ),
                    CalculatorButton(
                      text: '=',
                      bgColor: Colors.green,
                      onPressed: () => calculatorCtrl.calculateResult(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
