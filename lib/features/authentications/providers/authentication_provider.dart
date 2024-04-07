import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_master/features/authentications/login/ui/login_screen.dart';
import 'package:task_master/widgets/custom_widgets/custom_toast_widget.dart';

class AuthenticationProviders extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isSignUpLoading = false;
  bool isUserCreated = false;
  User? get user => _user;

  Future<void> signIn({required BuildContext context, String ?email, String ?password}) async {
    FToast fToast = FToast().init(context);
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      _user = userCredential.user;
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showWarningToast(fToast, "No user found for that email");
      } else if (e.code == 'wrong-password') {
        showWarningToast(fToast, "Wrong password provided for that user");
      }else if (e.code == 'invalid-credential') {
        showWarningToast(fToast, "Invalid credentials");
      }
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String userName,
    required File profilePicture,
  }) async {
    FToast fToast = FToast().init(context);
    isSignUpLoading = true;
    notifyListeners();

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userID = credential.user!.uid;
      notifyListeners();
      String? imageUrl = await uploadImage(profilePicture, userID: userID);
      await addUser(
        email: email,
        userName: userName,
        imageUrl: imageUrl,
        doc: userID,
      );

      isSignUpLoading = false;
      notifyListeners();
      if(credential.user != null){
        if(isUserCreated == true){
          if(context.mounted){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
          }
        }else{
          showWarningToast(fToast, "Your sign up is unsuccessful");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        showWarningToast(fToast, "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        showWarningToast(fToast, "The account already exists for that email");
      }
      isSignUpLoading = false;
      notifyListeners();
    }catch (e,s) {
      showWarningToast(fToast, "Something went wrong");
      if(kDebugMode){
        print("Error : $e and $s");
      }
      isSignUpLoading = false;
      notifyListeners();
    }
  }

  Future<void> addUser({
    required String userName,
    required String email,
    required String? imageUrl,
    required String? doc,
  }) async {
    var users = FirebaseFirestore.instance.collection("users").doc(doc).set({
      'user_name': userName,
      'email': email,
      'profile_picture': imageUrl,
    }).catchError((error) {
      // Handle errors
    });

    await users.then((value) {
      if (kDebugMode) {
        print("User created");
      }
      isUserCreated = true;
      notifyListeners();
    });
  }

  Future<String?> uploadImage(File imageFile, {required String userID}) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref().child('user_images/$userID/${DateTime.now().millisecondsSinceEpoch}-${imageFile.path.split("/").last}');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      notifyListeners();
      return downloadURL;
    } catch (e) {
      // Handle errors
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
