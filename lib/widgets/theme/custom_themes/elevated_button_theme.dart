import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/text_styles.dart';


class TMElevatedButtonTheme{
  TMElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0.5,
    foregroundColor: TMCustomColors.elevatedButtonForegroundColor,
    backgroundColor: TMCustomColors.elevatedButtonBackgroundColor,
    disabledBackgroundColor: TMCustomColors.elevatedButtonDisabledBackgroundColor,
    disabledForegroundColor: TMCustomColors.elevatedButtonDisabledForegroundColor,
    side: const BorderSide(color: TMCustomColors.elevatedButtonSideColor),
    padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
    textStyle: TMCustomTextStyle.elevatedButtonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    )
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0.5,
    foregroundColor: TMCustomColors.elevatedButtonForegroundColor,
    backgroundColor: TMCustomColors.elevatedButtonBackgroundColor,
    disabledBackgroundColor: TMCustomColors.elevatedButtonDisabledBackgroundColor,
    disabledForegroundColor: TMCustomColors.elevatedButtonDisabledForegroundColor,
    side: const BorderSide(color: TMCustomColors.elevatedButtonSideColor),
    padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
    textStyle: TMCustomTextStyle.elevatedButtonTextStyle,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    )
  );
}