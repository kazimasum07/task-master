

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  bool isLoading = false;
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
                        child: const Icon(CupertinoIcons.camera,color: TMCustomColors.transparentColor,size: TMSizes.lg),
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
                isLoading == true?
                const Center(child: Padding(
                  padding: EdgeInsets.only(bottom: TMSizes.lg),
                  child: CircularProgressIndicator(color: TMCustomColors.primaryColor,),
                )) :
                GestureDetector(
                  onTap: ()async{
                    if (_formKey.currentState!.validate()) {
                      await signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          userName: fullNameController.text
                      );
                    }
                  },
                  child: Container(
                    width: size.width*1,
                    padding: const EdgeInsets.only(top: TMSizes.md,bottom: TMSizes.md,left: TMSizes.md,right: TMSizes.md),
                    margin: const EdgeInsets.symmetric(vertical: TMSizes.sectionGapsM),
                    decoration: BoxDecoration(
                        color: TMCustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(TMSizes.buttonRadius)
                    ),
                    child: Center(child: Text("Sign Up",style: TMCustomTextStyle.buttonTextStyle)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Future<String?> uploadImage(File imageFile,{String ?userID}) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref().child('user_images/$userID/${DateTime.now().millisecondsSinceEpoch}-${imageFile.path.split("/").last}');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      if (kDebugMode) {
        print("Error : $e");
      }
      return null;
    }
  }

  signUp({
    required String email,
    required String password,
    required String userName
  })async{
    setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userID = credential.user!.uid;
      String ?profilePicture = await uploadImage(images['profile_picture']!,userID: userID);
      await addUser(
          email: email,
          imageUrl: profilePicture,
          userName: userName,
          doc: userID
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e,subTrace) {
      if (kDebugMode) {
        print("Error while signup : ------>$e and $subTrace");
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  addUser({
    String ?userName,
    String ?email,
    String ?imageUrl,
    String ?doc,
  })async{
    var users = FirebaseFirestore.instance.collection("users").doc(doc).set({
      'user_name': userName, // John Doe
      'email': email,
      'profile_picture' : imageUrl
    }).catchError((error) { if (kDebugMode) {
        print("Failed to add user------->: $error");
      }});
    users.then((value) {
      if (kDebugMode) {
        print("User created");
      }
    });

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
