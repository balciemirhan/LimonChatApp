import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/color.dart';

final class AppTextStyle {
  const AppTextStyle._();

/*   static TextStyle h1({required bool bold, required Color color}) {
    return TextStyle(
      fontSize: 23,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  } */

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColor.lightText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: AppColor.lightText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: AppColor.lightText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: AppColor.lightText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: AppColor.lightText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: AppColor.lightText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: AppColor.lightText,
  );

  static const TextStyle loginIntroduction = TextStyle(
    color: AppColor.lightPrimary,
    fontSize: 16,
  );

  static const TextStyle notMember = TextStyle(
    color: AppColor.lightPrimary,
  );

  static const TextStyle registerNow = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.lightPrimary,
  );
}
