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
  late TextEditingController taskTitleController;
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

            GestureDetector(
              onTap: (){
                addTaskSheet(context, size);
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: TMCustomColors.primaryColor,
                child: Icon(CupertinoIcons.add,size: TMSizes.iconMd,),
              ),
            ),
            GestureDetector(
              onTap: (){

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
        const TaskScreen() : const SizedBox.shrink()
        ,
      ),
    );
  }

  void addTaskSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      backgroundColor: TMCustomColors.bottomSheetColor,
        isScrollControlled: true,
        context: context,
        builder: (_)=>GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: size.height*0.7,
            padding: const EdgeInsets.symmetric(horizontal: TMSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add new task",style: TMCustomTextStyle.textStyle,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: const Icon(Icons.cancel_outlined)
                    )
                  ],
                ),
                const SizedBox(height: TMSizes.spaceHeightSm,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: taskTitleController,
                  style: TMCustomTextStyle.textStyle,
                  cursorColor: TMCustomColors.primaryColor,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: TMCustomColors.bottomSheetColor,
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon:  const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(CupertinoIcons.news,
                            color: TMCustomColors.whiteColor),
                      ),
                      hintText: "Enter task title",
                      hintStyle: const TextStyle(color: TMCustomColors.whiteColor),
                      border: InputBorder.none,
                      focusedBorder: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      errorBorder: buildOutlineInputBorder(),
                      focusedErrorBorder: buildOutlineInputBorder()
                  ),
                  validator: (value) {
                    // Email validation logic here
                    if (value!.isEmpty) {
                      return 'Please enter task title';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: TMSizes.spaceHeightSm,),
                Text("Assigned To",style: TMCustomTextStyle.textStyle,),
                const SizedBox(height: TMSizes.spaceHeightSm,),
                Container(
                  width: size.width*1,
                  padding: const EdgeInsets.symmetric(horizontal: TMSizes.md,vertical: TMSizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: TMCustomColors.whiteColor,width: 0.5)
                  ),
                  child: Center(child: Text("Select To",style: TMCustomTextStyle.textStyle,)),
                ),
                const SizedBox(height: TMSizes.spaceHeightSm,),
                Text("Progress",style: TMCustomTextStyle.textStyle,),
                const SizedBox(height: TMSizes.spaceHeightSm,),
                Container(
                  width: size.width*1,
                  padding: const EdgeInsets.symmetric(horizontal: TMSizes.md,vertical: TMSizes.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: TMCustomColors.whiteColor,width: 0.5)
                  ),
                  child: Center(child: Text("In Progress",style: TMCustomTextStyle.textStyle,)),
                ),
                const SizedBox(height: TMSizes.spaceHeightSm,),

              ],
            ),
          ),
        )
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(30),
      borderSide:  const BorderSide(
        color: TMCustomColors.whiteColor,
        width: 0.5,
      ),
    );
  }

  initialiseController(){
    taskTitleController = TextEditingController();
  }

  taskMaster()async{
    initialiseController();

  }

  @override
  void initState() {
    super.initState();
    taskMaster();
  }
}
