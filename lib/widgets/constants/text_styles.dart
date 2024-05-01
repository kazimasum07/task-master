import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/sizes.dart';

import 'colors.dart';






class TMCustomTextStyle{
  TMCustomTextStyle._();

  static TextStyle splashHeader =  const TextStyle(
      fontSize: 36.0,
      color: TMCustomColors.headerTextColor,
      fontWeight: FontWeight.w700
  );

  static TextStyle header =  const TextStyle(
      fontSize: TMSizes.fontSizeXl,
      color: TMCustomColors.headerTextColor,
      fontWeight: FontWeight.w500
  );
  static TextStyle subHeader =  const TextStyle(
      fontSize: TMSizes.fontSizeLg,
      color: TMCustomColors.headerTextColor,
      fontWeight: FontWeight.w500
  );

  static TextStyle buttonTextStyle = const TextStyle(
      fontSize: 16,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w500
  );
  static TextStyle elevatedButtonTextStyle = const TextStyle(
      fontSize: 16,
      color: TMCustomColors.elevatedButtonTextColor,
      fontWeight: FontWeight.w600
  );
  static TextStyle appBarTextStyleLight =  TextStyle(
      fontSize: 18,
      color: TMCustomColors.appBarTextColorDark,
      fontWeight: FontWeight.w600
  );
  static TextStyle appBarTextStyleDark =  TextStyle(
      fontSize: 18,
      color: TMCustomColors.appBarTextColorLight,
      fontWeight: FontWeight.w600
  );
  static TextStyle outlineButtonTextStyleDark=  const TextStyle(
      fontSize: 16,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w600
  );
  static TextStyle outlineButtonTextStyleLight=  const TextStyle(
      fontSize: 16,
      color: TMCustomColors.blackColor,
      fontWeight: FontWeight.w600
  );
  static TextStyle chipThemeTextStyleLight=  const TextStyle(
      fontSize: 16,
      color: TMCustomColors.blackColor,
      fontWeight: FontWeight.w400
  );

  static TextStyle chipThemeTextStyleDark=  const TextStyle(
      fontSize: 16,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w400
  );

  static TextStyle textStyle = const TextStyle(
      fontSize: 16,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w400
  );
  static TextStyle textStyle14 = const TextStyle(
      fontSize: 14,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w400
  );

  static TextStyle hintTextStyle = const TextStyle(
      fontSize: 16,
      color: TMCustomColors.hintLevelTextColor,
      fontWeight: FontWeight.w400
  );
  static TextStyle hintTextStyleWhite = const TextStyle(
      fontSize: 16,
      color: TMCustomColors.hintLevelTextColor,
      fontWeight: FontWeight.w400
  );

  static TextStyle selectedNavTextStyle = const TextStyle(
      fontSize: 14,
      color: TMCustomColors.whiteColor,
      fontWeight: FontWeight.w400
  );

  static TextStyle navTextStyle = const TextStyle(
      fontSize: 12,
      color: TMCustomColors.hintLevelTextColor,
      fontWeight: FontWeight.w400
  );
}

// Color textClrLight=const Color(0xffF8F8F8);
// const Color textClrDark=Color(0xffE9E9EB);
// const Color cardClr=Color(0xff292B3E);
// const Color cardClr2=Color(0xff8E8E93);
// const Color backgroundClr=Color(0xff191A22);
// const Color buttonClr=Color(0xff246BFD);
// const Color formtextclr=Color(0xff8A8A8E);