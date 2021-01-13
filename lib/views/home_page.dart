import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iTalk/controllers/controller.dart';
import 'package:iTalk/widgets/calculator_body.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculateController());
    return Scaffold(
      appBar: AppBar(
        title: Text('iTalk'),
        actions: [
           IconButton(
             icon: Icon(Icons.settings),
             onPressed: () {
               _showOptionsMenu(context);
             },
           ),
        ],
      ),
      body: Column(
        children: [
          Expanded(flex:4 ,child: CalculatorBody()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom:0.0),

            ),
          ),
        ],
      ),
    );
  }
  Future<void> _showOptionsMenu(BuildContext context) async {
    int selected = await showMenu(
      position: RelativeRect.fromLTRB(100, 30, 18, 0),
      context: context,
      items: [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(Icons.edit),
              Text("Change Theme"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.settings),
              Text("More Settings"),
            ],
          ),
        ),
      ],
    );
    if (selected == 0) {
      Get.changeTheme(
          Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    } else {
      print('More');
    }
  }
}
