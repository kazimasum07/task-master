

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_master/features/authentications/login/ui/login_screen.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool isLoadingV2 = false;
  Map<String, File?> images = {
    "profile_picture": null,
  };
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: size.height*1,
            width: size.width*1,
            padding: const EdgeInsets.symmetric(horizontal: TMSizes.md),
            color: TMCustomColors.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: size.height*0.06,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
                            },
                            child: Text("Sign In",style: TMCustomTextStyle.buttonTextStyle,)
                        )
                      ],),
                    GestureDetector(
                      onTap: ()async{
                       await imageTakerDialog(size, "profile_picture");
                      },
                      child:
                      images['profile_picture']!=null?
                      CircleAvatar(
                        radius: 48,
                        backgroundImage: FileImage(images['profile_picture']!),
                        child: const Icon(CupertinoIcons.camera,color: TMCustomColors.whiteColor,size: TMSizes.lg,),
                      ):CircleAvatar(
                        radius: 48,
                        backgroundColor: TMCustomColors.hintLevelTextColor.withOpacity(0.3),
                        child: const Icon(CupertinoIcons.camera,color: TMCustomColors.whiteColor,size: TMSizes.lg,),
                      ),
                    )
                  ],
                ),
          
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Your email address",style: TMCustomTextStyle.hintTextStyle),
                      SizedBox(height: size.height*0.02),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        style: TMCustomTextStyle.textStyle,
                        cursorColor: TMCustomColors.primaryColor,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: TMCustomColors.backgroundColor,
                            contentPadding: const EdgeInsets.all(16.0),
                            prefixIcon:  const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(CupertinoIcons.mail,
                                  color: TMCustomColors.hintLevelTextColor),
                            ),
                            hintText: "Enter your email",
                            hintStyle: TMCustomTextStyle.hintTextStyle,
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
                            return 'Please enter an email address';
                          } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            if (!value.contains('@')) {
                              if(RegExp(
                                  r"^\+[0-9]")
                                  .hasMatch(value)){
                                if(value.length <13){
                                  return 'Please enter a valid phone number';
                                }else{
                                  return null;
                                }
                              }else if(RegExp(
                                  r"[0-9]")
                                  .hasMatch(value)){
                                if(value.length <13){
                                  return 'Please enter a valid phone number';
                                }else{
                                  return null;
                                }
                              }else{
                                return 'Please enter a valid email';
                              }
                            }else if(!value.contains('.com')){
                              return 'Please enter a valid email';
                            }
                          } else {
                            return null;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height*0.04),
          
                      Text(" Your full name ",style: TMCustomTextStyle.hintTextStyle),
                      SizedBox(height: size.height*0.02),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: fullNameController,
                        style: TMCustomTextStyle.textStyle,
                        cursorColor: TMCustomColors.primaryColor,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: TMCustomColors.backgroundColor,
                            contentPadding: const EdgeInsets.all(16.0),
                            prefixIcon:  const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(CupertinoIcons.mail,
                                  color: TMCustomColors.hintLevelTextColor),
                            ),
                            hintText: "Enter your name",
                            hintStyle: TMCustomTextStyle.hintTextStyle,
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
                            return 'Please enter your name';
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: size.height*0.04),Text(" Your password",style: TMCustomTextStyle.hintTextStyle),
                      SizedBox(height: size.height*0.02),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        style: TMCustomTextStyle.textStyle,
                        cursorColor: TMCustomColors.primaryColor,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: TMCustomColors.backgroundColor,
                            contentPadding: const EdgeInsets.all(16.0),
                            prefixIcon:  const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(CupertinoIcons.padlock,
                                  color: TMCustomColors.hintLevelTextColor),
                            ),
                            hintText: "Enter your password",
                            hintStyle: TMCustomTextStyle.hintTextStyle,
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
                            return 'Please enter a password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else {
                            if (!value.contains(RegExp(r'[a-z]'))) {
                              return 'Password must contain at least one lowercase letter';
                            } else if (!value.contains(RegExp(r'[A-Z]'))) {
                              return 'Password must contain at least one uppercase letter';
                            } else if (!value.contains(RegExp(r'\d'))) {
                              return 'Password must contain at least one number';
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(height: size.height*0.04),
                    ],
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    width: size.width*1,
                    padding: const EdgeInsets.only(top: TMSizes.md,bottom: TMSizes.md,left: TMSizes.md,right: TMSizes.md),
                    margin: const EdgeInsets.symmetric(vertical: TMSizes.sectionGapsM),
                    decoration: BoxDecoration(
                        color: TMCustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(TMSizes.buttonRadius)
                    ),
                    child: Center(child: Text("Continue",style: TMCustomTextStyle.buttonTextStyle)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> getImageFromCamera(String type) async {
  //   final ImagePicker picker = ImagePicker();
  //   final photoPicker = await picker.pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //
  //   if (photoPicker != null) {
  //     String fileName = photoPicker.path.split('/').last;
  //     setState(() {
  //       images[type] = photoPicker;
  //     });
  //   }
  // }

  // Future<void> getImageFromGallery(String type) async {
  //   final ImagePicker picker = ImagePicker();
  //   final photoPicker = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //
  //   if (photoPicker != null) {
  //     String fileName = photoPicker.path.split('/').last;
  //     setState(() {
  //       images[type] = photoPicker;
  //     });
  //   }
  // }

  Future<void> getImageFromGallery(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photoPicker = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (photoPicker != null) {
      final File imageFile = File(photoPicker.path);
      setState(() {
        images[type] = imageFile;
      });
    }
  }
  Future<void> getImageFromCamera(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photoPicker = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (photoPicker != null) {
      final File imageFile = File(photoPicker.path);
      setState(() {
        images[type] = imageFile;
      });
    }
  }
  imageTakerDialog(Size size, String image) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: TMCustomColors.backgroundColor.withOpacity(0.8),
          title: Center(child: Text("Select a method",style: TMCustomTextStyle.textStyle)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    getImageFromCamera(image);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: TMCustomColors.whiteColor)
                    ),
                    child: const Icon(CupertinoIcons.camera,size: 30,),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    getImageFromGallery(image);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: TMCustomColors.whiteColor)
                    ),
                    child: const Icon(Icons.photo,size: 35,),
                  ),
                ),
              ],
            )
          ],
        );

      },
    );
  }


  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(30),
      borderSide:  const BorderSide(
        color: TMCustomColors.hintLevelTextColor,
        width: 0.5,
      ),
    );
  }

  initialization(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
  }
  taskMaster(){
    initialization();
  }

  @override
  void initState() {
    super.initState();
    taskMaster();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
  }
}
