import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_master/features/authentications/sign_up/ui/sign_up_screen.dart';
import 'package:task_master/widgets/constants/colors.dart';
import 'package:task_master/widgets/constants/sizes.dart';
import 'package:task_master/widgets/constants/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SignUpScreen()));
                        },
                        child: Text("Sign Up",style: TMCustomTextStyle.buttonTextStyle,)
                    )
                  ],),
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
                    Text(" Your password",style: TMCustomTextStyle.hintTextStyle),
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
                  child: Center(child: Text("Login",style: TMCustomTextStyle.buttonTextStyle)),
                ),
              )
            ],
          ),
        ),
      ),
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
  }
}
