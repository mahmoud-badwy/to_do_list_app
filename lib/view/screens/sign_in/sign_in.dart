import 'package:flutter/material.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class SignInPage extends StatelessWidget {
  static const String pageRoute = 'sign_in_page';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome You again !',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 15,
                ),
                child: TextField(
                  controller: context
                      .watch<SignInController>()
                      .emailTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide:
                          BorderSide(width: 1.5, color: Colors.yellow[900]!),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: TextField(
                  controller: context
                      .watch<SignInController>()
                      .passwordTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.yellow),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide:
                          BorderSide(width: 1.5, color: Colors.yellow[900]!),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.yellow,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text.rich(
                style: TextStyle(fontSize: 18.0),
                TextSpan(
                  text: 'if you don\'t have an account ,try ',
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' Now',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
