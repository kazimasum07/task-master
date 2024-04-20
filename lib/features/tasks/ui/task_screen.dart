import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/enums.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<TaskStatus> tasksStatus= [
    TaskStatus.notStarted,
    TaskStatus.inProgress,
    TaskStatus.completed,
    TaskStatus.overDue,
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TMCustomColors.boxColor,
        title: Row(
          children: [
            Text("Masum team ",style: TMCustomTextStyle.appBarTextStyleLight),
            const Icon(CupertinoIcons.chevron_down,color: TMCustomColors.iconColor)
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: TMCustomColors.hintLevelTextColor.withOpacity(0.8),
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.search))
        ],
      ),
      body:  Container(
        height: size.height*1,
        width: size.width*1,
        padding: const EdgeInsets.all(08),
        decoration: const BoxDecoration(
          color: TMCustomColors.backgroundColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height: TMSizes.sectionGapsM,),
           Text("Project task"),
           Container(
              width: size.width*1,
              height: size.height*0.06,
              margin: EdgeInsets.only(top: TMSizes.spaceHeightSm),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tasksStatus.length,
                separatorBuilder: (_,index)=>const SizedBox(width: TMSizes.spaceWidthSm,),
                itemBuilder: (_,index)=>Container(
                  padding :const EdgeInsets.symmetric(horizontal: 16,vertical: 08),
                  decoration: BoxDecoration(
                    color: TMCustomColors.boxColor,
                    borderRadius: BorderRadius.circular(TMSizes.radiusSm)
                  ),
                  child: Center(child: Text(_getStatusText(tasksStatus[index]))),
                ),

              ),
            )
          ],
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
}
