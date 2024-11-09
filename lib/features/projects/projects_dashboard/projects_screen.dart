import 'package:flutter/material.dart';
import 'package:task_master/features/projects/all_project/ui/all_project_widget.dart';
import 'package:task_master/features/projects/completed_projects/ui/completed_project_widget.dart';
import 'package:task_master/features/projects/in_progress_projects/ui/in_progress_project_widget.dart';
import 'package:task_master/features/projects/not_started_projects/ui/not_started_project_widget.dart';
import 'package:task_master/features/projects/over_due_projects/ui/over_due_project_widget.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/enums.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class ProjectsScreen extends StatefulWidget {
  final Size ?size;
  const ProjectsScreen({this.size,super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> with SingleTickerProviderStateMixin {
  static const List<Widget> myTabs = [
    AllProjectListWidget(),
    Tab(text: 'RIGHT'),
  ];
  int selectedIndex = 0;
  late TabController tabController;
  //TabController tabController = TabController(length: length, vsync: )
  @override
  Widget build(BuildContext context) {
    final double heightSize = widget.size!.height;
    final double widthSize = widget.size!.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects",style: TextStyle(color: TMCustomColors.whiteColor,fontWeight: FontWeight.bold),),
        bottom: TabBar(
          labelColor: TMCustomColors.whiteColor,
          indicatorColor: TMCustomColors.primaryColor,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontSize: 14),
          isScrollable: true,
          controller: tabController,
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12),
          tabAlignment: TabAlignment.start,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          tabs:  [

            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("11",
                    style: TextStyle(
                      color: selectedIndex == 0 ? TMCustomColors.primaryColor : Colors.white70,
                      fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                  SizedBox(width: widthSize*0.012,),
                  const Text("All"),
                ],
              ),
            ),

            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("18",
                    style: TextStyle(
                        color: selectedIndex == 1 ? Colors.teal : Colors.white70,
                        fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                  SizedBox(width: widthSize*0.012,),
                  const Text("Not Started"),
                ],
              ),
            ),

            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("0",
                    style: TextStyle(
                        color: selectedIndex == 2 ? TMCustomColors.orangeColor : Colors.white70,
                        fontWeight: selectedIndex == 2 ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                  SizedBox(width: widthSize*0.012,),
                  const Text("In Progress"),
                ],
              ),
            ),

            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("08",
                    style: TextStyle(
                        color: selectedIndex == 3 ? TMCustomColors.activeGreenColor : Colors.white70,
                        fontWeight: selectedIndex == 3 ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                  SizedBox(width: widthSize*0.012,),
                  const Text("Completed"),
                ],
              ),
            ),

            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("50",
                    style: TextStyle(
                        color: selectedIndex == 4 ? TMCustomColors.redColor : Colors.white70,
                        fontWeight: selectedIndex == 4 ? FontWeight.bold : FontWeight.normal
                    ),
                  ),
                  SizedBox(width: widthSize*0.012,),
                  const Text("Over Due"),
                ],
              ),
            ),
          ],
        ),

      ),
      body: SafeArea(
        child: Container(
          height: heightSize*1,
          width: widthSize*1,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child:  TabBarView(
            controller: tabController,
              children: [
               AllProjectListWidget(widthSize: widthSize,heightSize: heightSize,),
               NotStartedProjectListWidget(widthSize: widthSize,heightSize: heightSize,),
               InProgressProjectListWidget(widthSize: widthSize,heightSize: heightSize,),
               CompletedProjectListWidget(widthSize: widthSize,heightSize: heightSize,),
               OverDueProjectListWidget(widthSize: widthSize,heightSize: heightSize,)
              ],
          ),
        ),
      ),
    );
  }

  String _getStatusText(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.overDue:
        return 'Overdue';
      default:
        return '';
    }
  }
  

  
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
}
