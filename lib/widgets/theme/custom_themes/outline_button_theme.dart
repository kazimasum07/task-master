import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/text_styles.dart';


class TMOutlineButtonTheme{
  TMOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TMCustomColors.blackColor,
      side: const BorderSide(color: TMCustomColors.blueColor),
      textStyle: TMCustomTextStyle.outlineButtonTextStyleLight,
      padding: const EdgeInsets.symmetric(vertical: 08,horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))
    )
  );
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: TMCustomColors.whiteColor,
          side: const BorderSide(color: TMCustomColors.blueAccentColor),
          textStyle: TMCustomTextStyle.outlineButtonTextStyleLight,
          padding: const EdgeInsets.symmetric(vertical: 08,horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))
      )
  );
}