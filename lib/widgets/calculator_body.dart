import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iTalk/controllers/controller.dart';
import 'package:iTalk/widgets/styles.dart';

class CalculatorBody extends StatelessWidget {
  final CalculateController controller = CalculateController.to;
  final box1 = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 18.0,
            color: Colors.white60,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'iTalk Calculator',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.firstNumberController,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Enter first number',
                          prefixIcon: Icon(Icons.looks_one_outlined)),
                      keyboardType: TextInputType.number,
                      // initialValue: box1.read("firstNumber"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.secondNumberController,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Enter second number',
                          prefixIcon: Icon(Icons.looks_two_outlined)),
                      keyboardType: TextInputType.number,
                      // initialValue: box1.read("secondNumber"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 280,
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          box1.write("firstNumber", controller.firstNumberController.text);
                          box1.write("secondNumber", controller.secondNumberController.text);
                          print(box1.read("firstNumber"));
                          print(box1.read("secondNumber"));

                          controller.calculate();
                        },
                        child: Text('Add', style: TextStyle(fontSize: 20),),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Text(
                      "${controller.result.value}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
