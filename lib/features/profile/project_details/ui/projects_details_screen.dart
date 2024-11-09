import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';

class ProjectsDetailsScreen extends StatefulWidget {
  final Color ?taskColor;
  const ProjectsDetailsScreen({super.key,this.taskColor});

  @override
  State<ProjectsDetailsScreen> createState() => _ProjectsDetailsScreenState();
}

class _ProjectsDetailsScreenState extends State<ProjectsDetailsScreen> {
  double tasksProgressValue = 0.9;
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Task 1', 'isCompleted': false},
    {'title': 'Task 2', 'isCompleted': false},
    {'title': 'Task 3', 'isCompleted': true},
    {'title': 'Task 4', 'isCompleted': false},
    {'title': 'Task 5', 'isCompleted': true},
    {'title': 'Task 6', 'isCompleted': false},
    {'title': 'Task 7', 'isCompleted': false},
    {'title': 'Task 8', 'isCompleted': true},
    {'title': 'Task 9', 'isCompleted': false},
    {'title': 'Task 10', 'isCompleted': true},
    {'title': 'Task 11', 'isCompleted': false},
    {'title': 'Task 12', 'isCompleted': false},
    {'title': 'Task 13', 'isCompleted': true},
    {'title': 'Task 14', 'isCompleted': false},
    {'title': 'Task 15', 'isCompleted': true},
    {'title': 'Task 16', 'isCompleted': false},
    {'title': 'Task 17', 'isCompleted': false},
    {'title': 'Task 18', 'isCompleted': true},
    {'title': 'Task 19', 'isCompleted': false},
    {'title': 'Task 20', 'isCompleted': true},
  ];
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
      ),
      body: SingleChildScrollView(
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
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
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
                      itemBuilder: (_,index)=>CheckboxListTile(
                        contentPadding: const EdgeInsets.all(0),
                        value: tasks[index]['isCompleted'],
                        onChanged: (value){
                          setState(() {
                            tasks[index]['isCompleted'] = value!;
                          });
                        },
                        title: Text(tasks[index]['title']),
                      )
                    )
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}
