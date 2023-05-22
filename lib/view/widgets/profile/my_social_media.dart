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
  const SocialMediaElement({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
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
