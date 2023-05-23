import 'package:flutter/material.dart';

class MySocialMedia extends StatelessWidget {
  const MySocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        SocialMediaElement(
          text: 'FaceBook',
        ),
        SocialMediaElement(
          text: 'GitHub',
        ),
        SocialMediaElement(
          text: 'LinkedIn',
        ),
      ],
    );
  }
}

class SocialMediaElement extends StatelessWidget {
  final String text;
  const SocialMediaElement({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //on tap icon
        // Uri urlParse = Uri.parse('https://flutter.dev');

        // if (await canLaunchUrl(urlParse)) {
        //   await launchUrl(urlParse);
        // } else {
        //   throw 'Could not launch https://flutter.dev';
        // }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.yellow,
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
