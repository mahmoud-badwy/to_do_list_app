import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../helper/mediaquery.dart';

class UserIsLogin extends StatelessWidget {
  const UserIsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(
          flex: 2,
        ),
        Hero(
          tag: 'profile',
          child: SizedBox(
            width: context.getWidth() / 2.5,
            height: context.getWidth() / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'assets/me.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: context.getHeight() / 50,
        ),
        const Text(
          'Mahmoud Badwy',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        SwitchListTile(
          activeTrackColor: Colors.green[200],
          activeColor: Colors.black,
          title: const Text(
            'make voice on done task',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          value: true,
          onChanged: (newValue) {},
        ),
        SwitchListTile(
          activeTrackColor: Colors.green[200],
          activeColor: Colors.black,
          value: true,
          title: const Text(
            'sync your Data',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          onChanged: (newValue) {},
        ),
        const Spacer(),
        Text.rich(
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
          TextSpan(
            text: 'This App make by ',
            children: <TextSpan>[
              TextSpan(
                text: 'Mahmoud Badwy',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // code to open / launch terms of service link here
                  },
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
