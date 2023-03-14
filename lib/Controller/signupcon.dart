import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/Screens/login.dart';

class signupcon extends GetxController {
  TextEditingController cone = TextEditingController();
  TextEditingController ctwo = TextEditingController();
  TextEditingController cthree = TextEditingController();

  Future<void> create() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: cone.text.toString().trim(),
              password: cthree.text.toString().trim());
      String? user = FirebaseAuth.instance.currentUser?.uid;
      FirebaseFirestore.instance.collection('Data').doc(user).set({
        'email': cone.text, // John Doe
        'password': cthree.text, // Stokes and Sons
        'name': ctwo.text,
      });
      Get.to(login());
      cone.clear();
      ctwo.clear();
      cthree.clear();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code,
        e.code,
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      print(e);
    }
  }
}
