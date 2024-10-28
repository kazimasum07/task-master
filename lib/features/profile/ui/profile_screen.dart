import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/widgets/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color: TMCustomColors.whiteColor,fontWeight: FontWeight.bold),),
        actions: [
          TextButton(
              onPressed: (){},
              child: const Text("Sign Out",style: TextStyle(color: TMCustomColors.redColor,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: size.height*0.012,),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text("John Doe",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),),
              subtitle: Text("Flutter Developer",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14,fontWeight: FontWeight.w400),),
              leading: CircleAvatar(
                radius: 32,
                backgroundColor: TMCustomColors.boxColor,
              ),
            ),
            SizedBox(height: size.height*0.008,),
            Container(
              width: size.width*1,
              padding: const EdgeInsets.only(left: 16,right: 8,top: 16),
              decoration: BoxDecoration(
                color: TMCustomColors.boxColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),),
                  SizedBox(height: size.height*0.008,),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("My Information",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Change Password",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("My Team",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Notifications",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  )

                ],
              ),
            ),
            SizedBox(height: size.height*0.012,),
            Container(
              width: size.width*1,
              padding: const EdgeInsets.only(left: 16,right: 8,top: 16),
              decoration: BoxDecoration(
                color: TMCustomColors.boxColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Help",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),),
                  SizedBox(height: size.height*0.008,),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("License",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Privacy Policy",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text("Log Out",style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16,color: TMCustomColors.redColor),),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
