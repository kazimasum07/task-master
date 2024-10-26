import 'package:dropdown_button2/dropdown_button2.dart';
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

  TextEditingController projectNameController = TextEditingController();
  TextEditingController selectedTeamController = TextEditingController();


  final List<String> teamList = [
    'Team 1',
    'Team 2',
    'Team 3',
    'Team 4',
    'Team 5',
    'Team 6',
    'Team 7',
    'Team 8',
    'Team 9',
    'Team 10',
  ];
  String? selectedValue;

  final List<String> taskStatusList = [
    'Not Started',
    'In Progress',
    'Completed',
    'Over Due'
  ];
  String? taskStatus;
  String? selectedDates = "Select Timeline";

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
                addProjectWidget(context, size);
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
            ),
            GestureDetector(
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
  void addProjectWidget(BuildContext context, Size size) {
    showModalBottomSheet(
        context: context,
        builder: (_)=>StatefulBuilder(
          builder: (BuildContext context, Function(Function()) modalSheetState) => SingleChildScrollView(
            child: Container(
                width: size.width*1,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add new project"),
                        Icon(Icons.cancel_outlined)
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    TextFormField(
                      controller: projectNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.briefcase),
                        labelText: "Project Name",
                      ),
                    ),

                    SizedBox(height: size.height*0.02,),
                    DropdownButtonFormField2<String>(
                      items: teamList.map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                          style: const TextStyle(color: TMCustomColors.whiteColor),
                        ),
                      )).toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        modalSheetState(() {
                          selectedValue = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Assigned To',
                        hintText: "",
                        hintStyle:  const TextStyle(color: TMCustomColors.whiteColor),
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        border: Theme.of(context).inputDecorationTheme.border,
                        floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        focusedErrorBorder: Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        elevation: 1,
                        maxHeight: size.height*0.4,
                        width: size.width*0.82,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                        ),
                        offset: const Offset(10, 0),

                      ),
                      menuItemStyleData:  MenuItemStyleData(
                        height: size.height*0.064,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                      ),
                      validator: (value){
                        if (value==null) {
                          return 'Please select your gender';
                        } else {
                          return null;
                        }
                      },

                    ),

                    SizedBox(height: size.height*0.02,),
                    DropdownButtonFormField2<String>(
                      items: taskStatusList.map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                          style: const TextStyle(color: TMCustomColors.whiteColor),
                        ),
                      )).toList(),
                      value: taskStatus,
                      onChanged: (value) {
                        modalSheetState(() {
                          taskStatus = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Progress Status',
                        hintText: "",
                        hintStyle:  const TextStyle(color: TMCustomColors.whiteColor),
                        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                        border: Theme.of(context).inputDecorationTheme.border,
                        floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle,
                        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
                        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
                        focusedErrorBorder: Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        elevation: 1,
                        maxHeight: size.height*0.4,
                        width: size.width*0.82,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                        ),
                        offset: const Offset(10, 0),

                      ),
                      menuItemStyleData:  MenuItemStyleData(
                        height: size.height*0.064,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                      ),
                      validator: (value){
                        if (value==null) {
                          return 'Please select your gender';
                        } else {
                          return null;
                        }
                      },

                    ),

                    SizedBox(height: size.height*0.02,),
                    GestureDetector(
                      onTap: ()async{
                       var dates =  await showDateRangePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100)
                        );
                       print("Dates :  $dates");
                       print("Start Date:  ${dates!.start}");
                       print("End Date:  ${dates.end}");

                       modalSheetState(() {
                         selectedDates = "${monthConverter(dates.start.month)} ${dates.start.day} - ${monthConverter(dates.end.month)} ${dates.end.day}";
                       });

                      },
                      child: Container(
                        width: size.width*1,
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: TMCustomColors.greyColor,width: 1)
                        ),
                        child: Text("$selectedDates"),
                      ),
                    ),

                    SizedBox(height: size.height*0.032,),
                    GestureDetector(
                      onTap: ()async{

                      },
                      child: Container(
                        width: size.width*1,
                        padding: const EdgeInsets.only(top: TMSizes.md,bottom: TMSizes.md,left: TMSizes.md,right: TMSizes.md),
                        margin: const EdgeInsets.symmetric(vertical: TMSizes.sectionGapsM),
                        decoration: BoxDecoration(
                            color: TMCustomColors.primaryColor,
                            borderRadius: BorderRadius.circular(TMSizes.buttonRadius)
                        ),
                        child: Center(child: Text("Save",style: TMCustomTextStyle.buttonTextStyle)),
                      ),
                    )
                  ],
                ),
              ),
          ),

        ),
    );
  }

  monthConverter(input){
    if(input == 1){
      return "Jan";
    }else if(input == 2){
      return "Feb";
    }else if(input == 3){
      return "Mar";
    }else if(input == 4){
      return "Apr";
    }else if(input == 5){
      return "May";
    }else if(input == 6){
      return "Jun";
    }else if(input == 7){
      return "Jul";
    }else if(input == 8){
      return "Aug";
    }else if(input == 9){
      return "Sep";
    }else if(input == 10){
      return "Oct";
    }else if(input == 11){
      return "Nov";
    }else if(input == 12){
      return "Dec";
    }else{
      return "N/A";
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
