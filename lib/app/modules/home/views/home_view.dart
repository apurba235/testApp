import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEST APP'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  InputTextField(
                    onTyped: (value) {
                      controller.postLeftLength(value.replaceAll(' ', '').length);
                    },
                  ),
                  InputTextField(
                    onTyped: (value) {
                      controller.postRightLength(value.replaceAll(' ', '').length);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Obx(() {
                      final l = controller.leftInputField.value;
                      final r = controller.rightInputField.value;
                      return Transform.rotate(
                        angle: (l == 0 && r == 0)
                            ? 0
                            : l > r
                                ? -1.57 * ((l - r) / l)
                                : 1.57 * ((r - l) / r),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputsWeight(inputWeight: l),
                                InputsWeight(inputWeight: r),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class InputsWeight extends StatelessWidget {
  const InputsWeight({
    Key? key,
    required this.inputWeight,
  }) : super(key: key);
  final int inputWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        child: Text(
          '$inputWeight',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.onTyped,
  }) : super(key: key);

  final Function(String) onTyped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        onChanged: onTyped,
        maxLines: 10,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
