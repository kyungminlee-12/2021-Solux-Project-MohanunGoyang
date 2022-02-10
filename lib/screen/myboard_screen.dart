import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/result_screen.dart';
import 'package:mohanun_goyang/screen/add_screen.dart';

import 'document_view.dart';

class MyBoardScreen extends StatefulWidget {
  _MyBoardScreenState createState() => _MyBoardScreenState();
}

class _MyBoardScreenState extends State<MyBoardScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> currentStream;

  @override
  void initState() {
    super.initState();
    currentStream = firestore
        .collection("board")
        .where("writer", isEqualTo: user!.displayName)
        .orderBy("date", descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: StreamBuilder(
        stream: currentStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.only(top: statusBar),
                child: Center(child: CircularProgressIndicator()));
          }
          List<DocumentSnapshot> docs = snapshot.data.docs;
          return Padding(
              padding: EdgeInsets.only(top: statusBar),
              child: ListView(
                padding: EdgeInsets.only(top: 20.0),
                children: docs
                    .map((eachDocument) => DocumentView(eachDocument))
                    .toList(),
              ));
        },
      ),
    );
  }
}
