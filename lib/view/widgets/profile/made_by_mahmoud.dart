import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/view/widgets/profile/my_social_media.dart';

class MadeByMahmoud extends StatelessWidget {
  const MadeByMahmoud({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.yellow[200],
                    content: const MySocialMedia(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
