import 'package:flutter/material.dart';
import 'package:to_do_list_app/helper/mediaquery.dart';

class ProfilePage extends StatelessWidget {
  static const String pageRoute = 'profile_page';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Hero(
              tag: 'profile',
              child: SizedBox(
                width: context.getWidth()/2 ,
                height: context.getWidth()/2,
                child: ClipRRect(

                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset('assets/me.jpg',fit: BoxFit.cover,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
