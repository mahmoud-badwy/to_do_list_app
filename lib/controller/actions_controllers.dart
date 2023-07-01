import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionsController with ChangeNotifier {
  Future<void> launchLink(String url) async {
    Uri urlParse = Uri.parse('https://$url');

    // if (await canLaunchUrl(urlParse)) {
    await launchUrl(mode: LaunchMode.externalNonBrowserApplication, urlParse);
    // } else {
    //   throw 'Could not launch https://$url';
    // }
  }
}
