import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColor.lightBg,
      primary: AppColor.lightPrimary,
      secondary: AppColor.lightSecondary,
      tertiary: AppColor.lightTertiary,
      inversePrimary: AppColor.lightInversePrimary,
    ),
  );
}
