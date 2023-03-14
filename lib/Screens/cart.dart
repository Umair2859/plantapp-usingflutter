import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to cart'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Cart')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .collection('Orders')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return new Text("Loading");
                }

                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data =
                          snapshot.data!.docs[index].data();
                      return Column(
                        children: [
                          LayoutBuilder(builder: (context, con) {
                            return GestureDetector(
                              onTap: (() {}),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 100,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            data['Name'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          data['Price'],
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        GestureDetector(
                                            onTap: () async {
                                              const snackdemo = SnackBar(
                                                content: Text(
                                                    'Item deleted from cart successfully'),
                                                backgroundColor: Colors.green,
                                                elevation: 10,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin: EdgeInsets.all(5),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackdemo);
                                              await FirebaseFirestore.instance
                                                  .runTransaction((Transaction
                                                      myTransaction) async {
                                                await myTransaction.delete(
                                                    snapshot.data!.docs[index]
                                                        .reference);
                                              });
                                            },
                                            child: Icon(Icons.delete)),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}
