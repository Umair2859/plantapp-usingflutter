import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:plant/Controller/logincontroller.dart';

class login extends GetView<logincontroller> {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<logincontroller>(() => logincontroller());
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, con) {
          return Container(
            height: con.maxHeight,
            width: con.maxWidth,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: con.maxHeight * 0.2,
                      width: con.maxWidth * 0.3,
                      child: Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_xd9ypluc.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.03,
                  ),
                  const Center(
                    child: Text(
                      'Plant App',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: con.maxWidth * 0.04,
                      ),
                      const Text(
                        'Login to continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
                      height: 50,
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
                            controller: controller.controller1,
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
                      height: 50,
                      width: con.maxWidth,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            controller: controller.controller2,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
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
                          if (_formKey.currentState!.validate()) {
                            controller.signIn();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill the form')),
                            );
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.take();
                      },
                      child: Text(
                        'click here to Signin',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: con.maxHeight * 0.05,
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
