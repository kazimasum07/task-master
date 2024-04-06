import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_master/widgets/custom_widgets/custom_toast_widget.dart';

class AuthenticationProviders extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

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

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
