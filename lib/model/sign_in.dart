import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class SigninMethods {
  void loginWithEmailandPasswordWithFire(
    FirebaseAuth credential, {
    required String email,
    required String password,
    required String route,
    required BuildContext context,
  }) async {
    try {
      await credential.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, route);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[200],
          content: loginMessage(context, message: e.message!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
  }

  void signupWithEmailandPasswordWithFire(
    FirebaseAuth credential, {
    required String email,
    required String password,
    required String name,
    required String route,
    required BuildContext context,
  }) async {
    try {
      await credential.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.currentUser!.updateDisplayName(name);
      print(credential.currentUser);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, route);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow[200],
          content: loginMessage(context, message: e.message!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
  }

  Column loginMessage(BuildContext context, {required String message}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          message,
          style: const TextStyle(
            fontSize: 19,
          ),
        ),
        SizedBox(
          height: context.getHeight() / 40,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: Colors.green[400],
            child: const Icon(Icons.done_rounded, color: Colors.white),
          ),
        )
      ],
    );
  }
}
