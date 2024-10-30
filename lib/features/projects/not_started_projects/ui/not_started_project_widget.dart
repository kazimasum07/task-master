import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';

class NotStartedProjectListWidget extends StatefulWidget {
  final double ?widthSize;
  final double ?heightSize;
  const NotStartedProjectListWidget({this.widthSize,this.heightSize,super.key});

  @override
  State<NotStartedProjectListWidget> createState() => _NotStartedProjectListWidgetState();
}

class _NotStartedProjectListWidgetState extends State<NotStartedProjectListWidget> {
  double taskProgressValue = 0.7;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: widget.widthSize!*1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TMSizes.spaceHeightSm),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_,index)=>Container(
              width: widget.widthSize!*1,
              padding: const EdgeInsets.symmetric(horizontal: TMSizes.md,vertical: TMSizes.sm),
              decoration: BoxDecoration(
                color: TMCustomColors.boxColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Web Design"),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.teal,
                          ),
                          SizedBox(width: widget.widthSize!*0.016,),
                          Text("2 Days Left"),
                          SizedBox(width: widget.widthSize!*0.02,),
                          Icon(Icons.more_vert,size: 16,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: widget.heightSize!*0.012),
                  Text("Kazi Masum Billah"),
                  SizedBox(height: widget.heightSize!*0.012),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: LinearProgressIndicator(
                          value: taskProgressValue,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Expanded(
                          child: Text("${taskProgressValue*100.floor()}%",textAlign: TextAlign.end,),
                      )
                    ],
                  ),
                  SizedBox(height: widget.heightSize!*0.012),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: TMCustomColors.whiteColor,
                            ),
                            SizedBox(width: widget.widthSize!*0.02,),
                            Text("12 Task"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: widget.widthSize!*0.1,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Positioned(
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: TMCustomColors.primaryColor,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: TMCustomColors.whiteColor,
                                  ),
                                ),
                              ),

                              Positioned(
                                right: 18,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: TMCustomColors.primaryColor,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: TMCustomColors.whiteColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 38,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundColor: TMCustomColors.primaryColor,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: TMCustomColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: widget.heightSize!*0.012),
                ],
              ),
            ),
            separatorBuilder: (_,index)=>const SizedBox(height: TMSizes.spaceHeightSm,),
            itemCount: 100
        ),
      ),
    );
  }
}
