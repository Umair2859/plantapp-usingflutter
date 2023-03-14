import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Herbs extends StatelessWidget {
  final String text;
  Herbs({required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Plants')
                  .doc(text)
                  .collection('Images')
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
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 400,
                              child: Center(
                                child: LayoutBuilder(builder: (context, con) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: con.maxHeight * 0.4,
                                          width: con.maxWidth * 0.5,
                                          child: Image.network(
                                            data['path'],
                                            fit: BoxFit.contain,
                                          )),
                                      SizedBox(
                                        height: 20,
                                        child: Text(
                                          data['Name'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Price=' + data['price'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          'Discription:  ' +
                                              data['Discription'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Temperature' + data['Temperature'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.teal),
                                          onPressed: () {
                                            String name = data['Name'];
                                            String price = data['price'];

                                            try {
                                              const snackdemo = SnackBar(
                                                content: Text(
                                                    'Item has been added to cart successfully'),
                                                backgroundColor: Colors.green,
                                                elevation: 10,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                margin: EdgeInsets.all(5),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackdemo);
                                              String? user = FirebaseAuth
                                                  .instance.currentUser?.uid;
                                              FirebaseFirestore.instance
                                                  .collection('Cart')
                                                  .doc(user)
                                                  .collection('Orders')
                                                  .doc()
                                                  .set({
                                                'Name': name,
                                                'Price': price,
                                              });
                                            } on FirebaseAuthException catch (e) {
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          child: Text('Add to cart'))
                                    ],
                                  );
                                }),
                              )),
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}
