import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';
import 'package:to_do_list_app/view/screens/profile.dart';
import 'package:to_do_list_app/view/widgets/floating_action_button.dart';
import 'package:to_do_list_app/view/widgets/my_nav_bar.dart';

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
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, ProfilePage.pageRoute),
            child: Hero(
              tag: 'profile',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  'assets/me.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: const Text('You Can Do it !'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ],
      ),
      body: SafeArea(
        child: context
            .watch<ToggleTabsController>()
            .mytabs[context.watch<ToggleTabsController>().curruntTab][0],
      ),
      floatingActionButton: const MyFloatingActionButton(),
      bottomNavigationBar: MyBottomNavigatoinBar(
          curruntTab: context.watch<ToggleTabsController>().curruntTab),
    );
  }
}
