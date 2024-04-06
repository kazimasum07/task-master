// import 'package:flutter/material.dart';
// import 'package:task_master/widgets/constants/images.dart';
// import 'package:task_master/widgets/constants/strings.dart';
// import 'package:task_master/widgets/constants/text_styles.dart';
//
// class OnBoardingWidget extends StatelessWidget {
//   const OnBoardingWidget({
//     super.key,
//     required this.size,
//     required this.headLine
//   });
//
//   final Size size;
//   final String headLine;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               SizedBox(height: size.height*0.2,),
//               Container(
//                 height: size.height*0.096,
//                 width: size.width*0.2,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     image: const DecorationImage(image: AssetImage(TMImage.appLogo),fit: BoxFit.cover)
//                 ),
//               ),
//               Text(TMStrings.appTitle,style: TMCustomTextStyle.splashHeader),
//             ],
//           ),
//           Text(headLine,style: TMCustomTextStyle.header),
//           SizedBox(height: size.height*0.01,),
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   SizedBox(width: size.width*0.01),
//                   OutlinedButton(onPressed: (){}, child: Text("Login",style: TMCustomTextStyle.buttonTextStyle)),
//                   Text("Or",style: TMCustomTextStyle.buttonTextStyle),
//                   ElevatedButton(onPressed: (){}, child: Text("Sign up",style: TMCustomTextStyle.buttonTextStyle)),
//                   SizedBox(width: size.width*0.01),
//                 ],
//               ),
//               SizedBox(height: size.height*0.04,),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }