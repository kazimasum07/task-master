import 'package:flutter/material.dart';
import 'package:task_master/widgets/theme/custom_themes/floating_action_button_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outline_button_theme.dart';
import 'custom_themes/text_theme.dart';
import 'custom_themes/textform_field_theme.dart';


class TMAppTheme{
  TMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TMTextTheme.lightTextTheme,
    elevatedButtonTheme: TMElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TMAppBarTheme.lightAppBarTheme,
    checkboxTheme: TMCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TMBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TMOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TMTextFormFieldTheme.lightInputDecorationTheme,
    chipTheme: TMChipTheme.lightChipTheme,
    floatingActionButtonTheme: TMFloatingActionButtonTheme.lightFloatingActionButtonTheme

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TMTextTheme.darkTextTheme,
    elevatedButtonTheme: TMElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TMAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TMBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TMCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: TMOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TMTextFormFieldTheme.darkInputDecorationTheme,
    chipTheme: TMChipTheme.darkChipTheme,
    floatingActionButtonTheme: TMFloatingActionButtonTheme.darkFloatingActionButtonTheme
  );
}