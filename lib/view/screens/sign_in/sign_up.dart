import 'package:flutter/material.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class SignUpPage extends StatelessWidget {
  static const String pageRoute = 'sign_up_page';

  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getWidth() / 20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'Welcome !',
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
                controller:
                    context.watch<SignInController>().nameTextEditingController,
                decoration: InputDecoration(
                  hintText: 'Name',
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
            TextField(
              controller:
                  context.watch<SignInController>().emailTextEditingController,
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
                top: 15,
              ),
              child: Consumer<SignInController>(
                builder: (BuildContext context, value, Widget? child) {
                  return TextField(
                    controller: value.passwordTextEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: value.obscurePassword,
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
                      suffixIcon: IconButton(
                        onPressed: value.obscureOnPressed,
                        icon: Icon(
                          value.obscurePassword
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: () {
                context.read<SignInController>().signup(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.yellow,
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
