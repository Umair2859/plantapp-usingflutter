import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';
import 'package:plant/Screens/login.dart';

import '../Controller/signupcon.dart';

class signup extends GetView<signupcon> {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<signupcon>(() => signupcon());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, con) {
          return Container(
            height: con.maxHeight,
            width: con.maxWidth,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      height: con.maxHeight * 0.2,
                      width: con.maxWidth * 0.3,
                      child: Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_prkjnzba.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: Container(
                      height: con.maxHeight * 0.08,
                      width: con.maxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: controller.cone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: Container(
                      height: con.maxHeight * 0.08,
                      width: con.maxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: controller.ctwo,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: Container(
                      height: con.maxHeight * 0.08,
                      width: con.maxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: controller.cthree,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: con.maxWidth * 0.1, right: con.maxWidth * 0.1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      width: con.maxWidth,
                      height: con.maxHeight * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.create();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill the form')),
                            );
                          }
                        },
                        child: const Text("Click here to continue"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
