import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/features/tasks/ui/task_screen.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;
  _onTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        width: size.width*1,
        height: size.height*0.085,
        color: TMCustomColors.greyColor.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                _onTap(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.list_bullet_indent,size: 20,color: selectedIndex ==1? TMCustomColors.whiteColor:TMCustomColors.hintLevelTextColor),
                  Text("Tasks",style: selectedIndex==1?TMCustomTextStyle.selectedNavTextStyle:TMCustomTextStyle.navTextStyle,)
                ],
              ),
            ),

            GestureDetector(
              onTap: (){
                _onTap(2);
              },
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.calendar,size: 20,color: selectedIndex ==2? TMCustomColors.whiteColor:TMCustomColors.hintLevelTextColor),
                  Text("Calender",style: selectedIndex==2?TMCustomTextStyle.selectedNavTextStyle:TMCustomTextStyle.navTextStyle)
                ],
              ),
            ),

            const CircleAvatar(
              radius: 24,
              backgroundColor: TMCustomColors.primaryColor,
              child: Icon(CupertinoIcons.add,size: TMSizes.iconMd,),
            ),
            GestureDetector(
              onTap: (){
                _onTap(4);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.square_list,size: 20,color: selectedIndex ==4? TMCustomColors.whiteColor:TMCustomColors.hintLevelTextColor),
                  Text("Projects",style: selectedIndex==4?TMCustomTextStyle.selectedNavTextStyle:TMCustomTextStyle.navTextStyle)
                ],
              ),
            ),GestureDetector(
              onTap: (){
                _onTap(5);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.person_alt_circle,size: 24,color: selectedIndex ==5? TMCustomColors.whiteColor:TMCustomColors.hintLevelTextColor,),
                  Text("Profile",style: selectedIndex==5?TMCustomTextStyle.selectedNavTextStyle:TMCustomTextStyle.navTextStyle,)
                ],
              ),
            ),

          ],
        ),
      ),
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child:
        selectedIndex == 1?
        TaskScreen() : SizedBox.shrink()
        ,
      ),
    );
  }
}
