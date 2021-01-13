import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iTalk/controllers/controller.dart';
import 'package:iTalk/widgets/calculator_body.dart';

class HomePage extends StatelessWidget {

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculateController());
    return Scaffold(
      appBar: AppBar(
        title: Text('iTalk'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              // controller.changeTheme(false);
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(flex:4 ,child: CalculatorBody()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom:32.0),
              child: Container(

                child: GestureDetector(
                onTap: () {
                Get.toNamed('/history_page');
                },
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(18.0),
                  //     side: BorderSide(color: Colors.blue)),
                child: Text('View history', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
