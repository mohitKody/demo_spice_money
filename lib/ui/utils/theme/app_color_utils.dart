
import 'package:flutter/material.dart';
import 'package:spice_money/framework/session.dart';

class AppColors {

  AppColors._();

  static bool isDarkMode = (Session.getIsAppThemeDark() ?? false);

  static const Color dark = Color(0xff1A2D31);
  static const Color primary = Color(0xff293897);
  static const Color primary_light = Color(0xff4050B6);
  static const Color primaryGreen = Color(0xff409DB9);
  static const Color primaryOrange = Color(0xffF84E3D);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xff000060);
  static const Color selected_green = Color(0xff4FE6B4);
  static const Color black_light= Color(0xff252525);
  static const Color black_grey= Color(0xffCFCFCF);
  static const Color white = Color(0xffffffff);
}
