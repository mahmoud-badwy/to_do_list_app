import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:to_do_list_app/controller/actions_controllers.dart';
import 'package:to_do_list_app/controller/tasks_controller.dart';
import 'package:to_do_list_app/controller/toggle_tabs.dart';

List<SingleChildWidget> myControllers() {
  return [
    ChangeNotifierProvider(
      create: (context) => TasksController(),
    ),
    ChangeNotifierProvider(
      create: (context) => ToggleTabsController(),
    ),
    ChangeNotifierProvider(
      create: (context) => ActionsController(),
    )
  ];
}
