import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/links.dart';
import '../../../controller/actions_controllers.dart';
import '../../../helper/mediaquery.dart';

class MySocialMedia extends StatelessWidget {
  const MySocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SocialMediaElement(
          text: 'FaceBook',
          url: AppLinks.facebookLink,
        ),
        const SocialMediaElement(
          text: 'GitHub',
          url: AppLinks.githubLink,
        ),
        const SocialMediaElement(
          text: 'LinkedIn',
          url: AppLinks.linkedinLink,
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
  final String text, url;
  const SocialMediaElement({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<ActionsController>().launchLink(url),
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
