import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/text_styles.dart';


class TMChipTheme{
  TMChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor:  TMCustomColors.greyColor.withOpacity(0.4),
    labelStyle: TMCustomTextStyle.chipThemeTextStyleLight,
    selectedColor: TMCustomColors.blueColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor:  TMCustomColors.whiteColor
  );


  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor:  TMCustomColors.greyColor,
    labelStyle: TMCustomTextStyle.chipThemeTextStyleDark,
    selectedColor: TMCustomColors.blueColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
    checkmarkColor:  TMCustomColors.whiteColor
  );

}