import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../controller/actions_controllers.dart';
import '../controller/tasks_controller.dart';
import '../controller/toggle_tabs.dart';

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
