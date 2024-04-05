import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';


class TMCheckboxTheme{
  TMCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    checkColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return TMCustomColors.whiteColor;
      }else{
        return TMCustomColors.blackColor;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states){
      if(states.contains(MaterialState.selected)){
        return TMCustomColors.primaryColor;
      }else{
        return TMCustomColors.transparentColor;
      }
    })
  );
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      checkColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return TMCustomColors.whiteColor;
        }else{
          return TMCustomColors.blackColor;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.selected)){
          return TMCustomColors.primaryColor;
        }else{
          return TMCustomColors.transparentColor;
        }
      })
  );
}