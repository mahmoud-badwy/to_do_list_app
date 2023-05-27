import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/sign_in_controller.dart';
import '../../controller/tasks_controller.dart';
import '../../controller/toggle_tabs.dart';
import 'profile.dart';
import '../widgets/home/floating_action_button.dart';
import '../widgets/home/my_pop_up_menu.dart';
import '../widgets/home/my_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  static const String pageRoute = 'home_page';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        context.read<TasksController>().getData();
        context.read<SignInController>().checkUser();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            right: 5.0,
            left: 15.0,
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, ProfilePage.pageRoute),
            child: Hero(
              tag: 'profile',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: const Text('You Can Do it !'),
        actions: const [MyPopUpMenuButton()],
      ),
      body: SafeArea(child: Consumer<ToggleTabsController>(
        builder: (context, value, child) {
          return PageView(
            controller: value.pageViewController,
            onPageChanged: value.changeCurruntTab,
            children: [
              value.mytabs[0][0],
              value.mytabs[1][0],
              value.mytabs[2][0],
            ],
          );
        },
      )),
      floatingActionButton: const MyFloatingActionButton(),
      bottomNavigationBar: MyBottomNavigatoinBar(
          curruntTab: context.watch<ToggleTabsController>().curruntTab),
    );
  }
}
