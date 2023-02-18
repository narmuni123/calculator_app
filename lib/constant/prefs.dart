import 'package:calculator_app/constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

RxBool isLightTheme = false.obs;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool(TextConstants.theme, isLightTheme.value);
}

getThemeStatus() async {
  var isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool(TextConstants.theme) ?? true;
  }).obs;
  isLightTheme.value = (await isLight.value);
  Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
}