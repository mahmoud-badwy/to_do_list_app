import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';
import 'package:to_do_list_app/view/widgets/floating_action_button.dart';
import 'package:to_do_list_app/view/widgets/my_nav_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
