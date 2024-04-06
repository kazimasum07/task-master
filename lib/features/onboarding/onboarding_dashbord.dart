// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:task_master/widgets/constants/colors.dart';
// import 'onboarding_widget.dart';
//
// class OnBoardingDashboard extends StatefulWidget {
//   const OnBoardingDashboard({super.key});
//
//   @override
//   State<OnBoardingDashboard> createState() => _OnBoardingDashboardState();
// }
//
// class _OnBoardingDashboardState extends State<OnBoardingDashboard> {
//   final pageController = PageController(viewportFraction: 0.8, keepPage: true);
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         height: size.height*1,
//         width: size.width*1,
//         color: TMCustomColors.backgroundColor,
//         child: Stack(
//             children: [
//               PageView(
//                 controller: pageController,
//                 children: [
//                   OnBoardingWidget(size: size,headLine: "Update Progress Your Work for The Team",),
//                   OnBoardingWidget(size: size,headLine: "Create a Task and Assign it to Your Team Members",),
//                 ],
//               ),
//               Positioned(
//                 left: 40,
//                 bottom: 120,
//                 child: SmoothPageIndicator(
//                   controller: pageController,
//                   count: 3,
//                   effect: const ExpandingDotsEffect(
//                     activeDotColor: TMCustomColors.primaryColor,
//                     dotHeight: 6
//                   )
//                 ),
//               ),
//             ]
//         ),
//       ),
//     );
//   }
// }
//
//
