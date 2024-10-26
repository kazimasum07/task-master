import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';


class TMBottomSheetTheme{
  TMBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TMCustomColors.whiteColor,
    modalBackgroundColor: TMCustomColors.whiteColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );
   
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      dragHandleColor: TMCustomColors.blackColor,
      backgroundColor: TMCustomColors.darkBottomSheetBackgroundColor,
      modalBackgroundColor: TMCustomColors.darkBottomSheetBackgroundColor,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );

}