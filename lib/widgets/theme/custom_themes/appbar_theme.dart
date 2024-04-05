import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/text_styles.dart';


class TMAppBarTheme{
  TMAppBarTheme._();

   static AppBarTheme lightAppBarTheme = AppBarTheme(
     elevation: 0.5,
     centerTitle: true,
     scrolledUnderElevation: 0.5,
     backgroundColor: TMCustomColors.appBarBackgroundColor,
     surfaceTintColor: TMCustomColors.appBarSurfaceTintColor,
     iconTheme: const IconThemeData(color: TMCustomColors.blackColor,size: 24),
     actionsIconTheme: const IconThemeData(color: TMCustomColors.blackColor,size: 24),
     titleTextStyle: TMCustomTextStyle.appBarTextStyleLight
   );

   static AppBarTheme darkAppBarTheme = AppBarTheme(
     elevation: 0.5,
     centerTitle: true,
     scrolledUnderElevation: 0.5,
     backgroundColor: TMCustomColors.appBarBackgroundColor,
     surfaceTintColor: TMCustomColors.appBarSurfaceTintColor,
     iconTheme: const IconThemeData(color: TMCustomColors.blackColor,size: 24),
     actionsIconTheme: const IconThemeData(color: TMCustomColors.whiteColor,size: 24),
     titleTextStyle: TMCustomTextStyle.appBarTextStyleDark
   );
}