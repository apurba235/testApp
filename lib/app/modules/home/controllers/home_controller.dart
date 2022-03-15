import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final leftInputField = 0.obs;
  final rightInputField = 0.obs;

  postLeftLength(int l) {
    FirebaseFirestore.instance.collection('values').doc('left_right_value').set({'left': l});
  }

  postRightLength(int r) {
    FirebaseFirestore.instance.collection('values').doc('left_right_value').set({'right': r});
  }

  @override
  void onInit() {
    leftInputField.bindStream(FirebaseFirestore.instance
        .collection('values')
        .doc('left_right_value')
        .snapshots()
        .map((DocumentSnapshot event) {
      return event['left'];
    }));
    rightInputField.bindStream(FirebaseFirestore.instance
        .collection('values')
        .doc('left_right_value')
        .snapshots()
        .map((DocumentSnapshot event) {
      return event['right'];
    }));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
