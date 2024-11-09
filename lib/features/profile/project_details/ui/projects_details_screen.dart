import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';

class ProjectsDetailsScreen extends StatefulWidget {
  final Color ?taskColor;
  const ProjectsDetailsScreen({super.key,this.taskColor});

  @override
  State<ProjectsDetailsScreen> createState() => _ProjectsDetailsScreenState();
}

class _ProjectsDetailsScreenState extends State<ProjectsDetailsScreen> {
  TextEditingController taskNameController = TextEditingController();
  double tasksProgressValue = 0.9;
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Task 1', 'isCompleted': false},
    {'title': 'Task 2', 'isCompleted': false},
    {'title': 'Task 3', 'isCompleted': true},
    {'title': 'Task 4', 'isCompleted': false},
  ];

  bool addNewTask = false;
  @override
  Widget build(BuildContext context) {
    final double heightSize = MediaQuery.of(context).size.height;
    final double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Details",style: TextStyle(color: TMCustomColors.whiteColor,fontWeight: FontWeight.bold),),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.left_chevron,color: TMCustomColors.whiteColor,)
        ),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  addNewTask = true;
                });
              },
              icon: const Icon(Icons.add,size: 28,),
          ),
          SizedBox(width: widthSize*0.012,)
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
              setState(() {
                addNewTask = false;
                taskNameController.clear();
              });

            },
            child: SizedBox(
              height: heightSize*1,
              width: widthSize*1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: widthSize*1,
                        padding: const EdgeInsets.symmetric(horizontal: TMSizes.md,vertical: TMSizes.md),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: TMCustomColors.boxColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Web Designer - Kazi Masum Billah",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18),),
                            SizedBox(height: heightSize*0.012),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: TMCustomColors.whiteColor,
                                ),
                                SizedBox(width: widthSize*0.02,),
                                Text("12 Task",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.normal),),
                              ],
                            ),
                            SizedBox(height: heightSize*0.016),
                            Text("Goals",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.normal),),
                            SizedBox(height: heightSize*0.004),
                            Text("Lorem ipsum dolor sit amet, consectetur adipis cing elit. Sit tristique porttitor magna turpis consequat, sed. At urna, cras ultricies tristique.",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: TMCustomColors.greyColor),),
                            SizedBox(height: heightSize*0.016),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.calendar_today_outlined,size: 18,),
                                      SizedBox(width: widthSize*0.02,),
                                      Text("Marc 13, 17:00",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.normal)),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(CupertinoIcons.bag,size: 18,),
                                      SizedBox(width: widthSize*0.02,),
                                      Text("Medium Project",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.normal),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: heightSize*0.008),
                          ],
                        )
                    ),
                    SizedBox(height: heightSize*0.012),
                    Container(
                        width: widthSize*1,
                        padding: const EdgeInsets.symmetric(horizontal: TMSizes.md,vertical: TMSizes.md),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            color: TMCustomColors.boxColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text("Tasks (${tasks.where((task) => task['isCompleted'] == true).length}/${tasks.length})",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: LinearProgressIndicator(
                                      value: tasksProgressValue,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(widget.taskColor!),
                                      minHeight: 10,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: heightSize*0.008),
                            ListView.separated(
                              physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: tasks.length,
                              separatorBuilder: (_,index)=>SizedBox(height: heightSize*0.004,),
                              itemBuilder: (_,index)=>GestureDetector(
                                onLongPress: (){
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (_)=>AlertDialog(
                                          backgroundColor: TMCustomColors.whiteColor.withOpacity(0.4),
                                          title: Text("Warning!"),
                                          content: Text("Do you want to delete this task?"),
                                          actions: [
                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                                                decoration:  BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                child: const Text("Cancel",textAlign: TextAlign.center,),
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  tasks.removeAt(index);
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      behavior: SnackBarBehavior.floating,
                                                      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 48),
                                                      backgroundColor: TMCustomColors.activeGreenColor,
                                                      content: Center(child: Text("Task deleted successful",style: TextStyle(fontWeight: FontWeight.bold),)),duration: Duration(seconds: 2),
                                                    ),
                                                  );
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                                                decoration:  BoxDecoration(
                                                    color: TMCustomColors.redColor,
                                                    borderRadius: BorderRadius.circular(12)
                                                ),
                                                child: const Text("Delete",textAlign: TextAlign.center,),
                                              ),
                                            ),
                                          ],
                                        )
                                    );
                                    //tasks.removeAt(index);
                                  });
                                },
                                child: CheckboxListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  value: tasks[index]['isCompleted'],
                                  onChanged: (value){
                                    setState(() {
                                      tasks[index]['isCompleted'] = value!;
                                    });
                                  },
                                  title: Text(tasks[index]['title']),
                                ),
                              )
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          addNewTask == true?
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              height: heightSize*0.26,
              decoration: const BoxDecoration(
                  color: TMCustomColors.blackColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Add new task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: heightSize*0.024,),
                  TextFormField(
                    controller: taskNameController,
                    decoration: const InputDecoration(
                      labelText: "Task Name",
                    ),
                  ),
                  SizedBox(height: heightSize*0.024,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              taskNameController.clear();
                              addNewTask = false;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                            decoration:  BoxDecoration(
                              color: TMCustomColors.redColor,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: const Text("Cancel",textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              tasks.add({'title': taskNameController.text, 'isCompleted':false});
                              addNewTask = false;
                              taskNameController.clear();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 48),
                                backgroundColor: TMCustomColors.activeGreenColor,
                                content: Center(child: Text("New task added successful",style: TextStyle(fontWeight: FontWeight.bold),)),duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                            decoration:  BoxDecoration(
                              color: TMCustomColors.primaryColor,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: const Text("Add Task",textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
                      ),
            ],
          ) :
          const SizedBox.shrink()
        ],
      )
    );
  }

  @override
  void dispose() {
    taskNameController.dispose();
    super.dispose();
  }
}
