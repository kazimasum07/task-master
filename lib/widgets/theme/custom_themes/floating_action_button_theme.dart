import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';

class TMFloatingActionButtonTheme{
  TMFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData lightFloatingActionButtonTheme = const FloatingActionButtonThemeData(
    backgroundColor: TMCustomColors.primaryColor
  );

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme = const FloatingActionButtonThemeData(
    backgroundColor: TMCustomColors.primaryColor
  );
}