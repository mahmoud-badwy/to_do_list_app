import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/sign_in_model.dart';
import 'package:to_do_list_app/view/screens/home.dart';
import 'package:to_do_list_app/view/widgets/home/my_alert_widget.dart';

class SignInController with ChangeNotifier {
  FirebaseAuth credential = FirebaseAuth.instance;

  SigninMethods signinMethods = SigninMethods();
  bool isLogIn = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  void signin(context) {
    signinMethods.loginWithEmailandPasswordWithFire(credential,
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
        context: context,
        route: MyHomePage.pageRoute);
    // checkUser();
  }

  void signup(context) {
    signinMethods.signupWithEmailandPasswordWithFire(
      credential,
      name: nameTextEditingController.text,
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
      context: context,
      route: MyHomePage.pageRoute,
    );
    // checkUser();
  }

  void signOut(BuildContext context) async {
    await credential.signOut();
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow[200],
        content: const MyAlertWidget(
            text: 'SignOut Successfully',
            icon: Icons.done_rounded,
            color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    // checkUser();
    notifyListeners();
  }

  checkUser() {
    if (credential.currentUser != null) {
      isLogIn = true;
    } else {
      isLogIn = false;
    }
  }
}
