import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/model/sign_in_model.dart';
import 'package:to_do_list_app/view/screens/home.dart';

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
  }

  checkUser() {
    if (credential.currentUser != null) {
      isLogIn = true;
    } else {
      isLogIn = false;
    }
  }
}
