import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/images.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/strings.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height*1,
        width: size.width*1,
        color: TMCustomColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height*0.01,),
            Column(
              children: [
                Container(
                  height: size.height*0.096,
                  width: size.width*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(image: AssetImage(TMImage.appLogo),fit: BoxFit.cover)
                  ),
                ),
                Text(TMStrings.appTitle,style: TMCustomTextStyle.splashHeader),
                Text("Your personal task manager",style: TMCustomTextStyle.subHeader),
              ],
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: size.width*1,
                padding: const EdgeInsets.only(top: TMSizes.md,bottom: TMSizes.md,left: TMSizes.md,right: TMSizes.md),
                margin: const EdgeInsets.symmetric(horizontal: TMSizes.sm,vertical: TMSizes.sectionGapsM),
                decoration: BoxDecoration(
                  color: TMCustomColors.primaryColor,
                  borderRadius: BorderRadius.circular(TMSizes.buttonRadius)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Getting Started",style: TMCustomTextStyle.buttonTextStyle),
                    const Icon(Icons.chevron_right_outlined)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




