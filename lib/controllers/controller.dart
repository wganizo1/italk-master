import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iTalk/services/calculate.service.dart';

class CalculateController extends GetxController {

  final box = GetStorage();

  // bool get isDark => box.read('darkmode') ?? false;
  // ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  // void changeTheme(bool val) => box.write('darkmode', val);
  static CalculateController to = Get.find();

  TextEditingController firstNumberController;
  TextEditingController secondNumberController;
  CalculateService _calculateService;
  var result = "".obs;

  CalculateController() {
    _calculateService = CalculateService();
  }

  @override
  void onInit() {
    firstNumberController = TextEditingController(text: box.read('firstNumber'));
    secondNumberController = TextEditingController(text: box.read('secondNumber'));
    super.onInit();
  }

  @override
  void onClose() {
    firstNumberController?.dispose();
    secondNumberController?.dispose();
    super.onClose();
  }

  List<String> history = [];


  calculate() async {
    if (firstNumberController.text == "" || secondNumberController.text == "") {
      Get.snackbar(
        "Error",
        "Empty fields",
      );
      return;
    }

    try {
      result.value = await _calculateService.calculateTwoNumbers(
          firstNumberController.text.trim(),
          secondNumberController.text.trim());

      box.write("firstNumber", firstNumberController.text.trim());
      box.write("secondNumber", secondNumberController.text.trim());
      DateTime now = DateTime.now();

      String tym = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString()}:${DateTime.now().minute}";
      history.add(tym + ' --> ' +result.value );
      box.write('history', history);

      firstNumberController.clear();
      secondNumberController.clear();

    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Error", middleText: e.message, actions: [
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        ),
      ]);
      print(e);
    }
  }
}


class Test {
  String result;
  DateTime dateTime;

  Test({this.result, this.dateTime});

  Test.fromJson(Map<String, dynamic> json)
      : result = json['result'],
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'dateTime': dateTime,
    };
  }
}