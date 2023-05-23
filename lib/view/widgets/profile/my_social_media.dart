import 'package:flutter/material.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class MySocialMedia extends StatelessWidget {
  const MySocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SocialMediaElement(
          text: 'FaceBook',
        ),
        const SocialMediaElement(
          text: 'GitHub',
        ),
        const SocialMediaElement(
          text: 'LinkedIn',
        ),
        SizedBox(
          height: context.getHeight() / 40,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: Colors.red[400],
            child: const Icon(Icons.close, color: Colors.white),
          ),
        )
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/social_media_icons/${text.toLowerCase()}.png',
                width: 30,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
