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
                  'assets/images/user.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        title: const Text('You Can Do it !'),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),

            itemBuilder: (context) => [
              // PopupMenuItem 1
              PopupMenuItem(
                value: 1,
                // row with 2 children
                child: Row(
                  children: const [
                    Icon(Icons.star),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Get The App")
                  ],
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 2,
                // row with two children
                child: Row(
                  children: const [
                    Icon(Icons.chrome_reader_mode),
                    SizedBox(
                      width: 10,
                    ),
                    Text("About")
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                // row with 2 children
                child: Row(
                  children: const [
                    Icon(Icons.star),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Get The App")
                  ],
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 4,
                // row with two children
                child: Row(
                  children: const [
                    Icon(Icons.chrome_reader_mode),
                    SizedBox(
                      width: 10,
                    ),
                    Text("About")
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
            color: Colors.grey,
            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              if (value == 1) {
                print(1);
              } else if (value == 2) {
                print(2);
              }
            },
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
