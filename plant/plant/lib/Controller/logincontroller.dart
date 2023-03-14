import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/Screens/dashboard.dart';
import 'package:plant/Screens/signup.dart';

class logincontroller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  void take() {
    Get.to(signup());
  }

  Future signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: controller1.text, password: controller2.text);

      controller1.clear();
      controller2.clear();
      Get.to(const dashboard());
    } on FirebaseAuthException catch (e) {
      return Get.snackbar(
        e.code,
        e.code,
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    }
  }
}
