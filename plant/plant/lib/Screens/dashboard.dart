import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant/Screens/Herbs.dart';
import 'package:plant/Screens/cart.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text('Dashboard'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.card_travel,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => cart()));
                },
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 150.0, left: 20, right: 20, bottom: 50),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Plants')
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
                                    onTap: (() {
                                      String name = data['Name'];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Herbs(text: name)));
                                    }),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: 160,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    data['Name'],
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Container(
                                                    height: 200,
                                                    width: con.maxWidth * 0.5,
                                                    child: Image.network(
                                                      data['path'],
                                                      fit: BoxFit.contain,
                                                    )),
                                              ],
                                            ),
                                          )),
                                    ),
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
            ],
          ),
        ),
      ),
      onWillPop: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return Future.value(true);
      },
    );
  }
}
