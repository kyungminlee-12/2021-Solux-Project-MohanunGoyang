import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late String title;
  late String contents;
  late String category;
  User? user = FirebaseAuth.instance.currentUser;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("글쓰기"),
        backgroundColor: const Color(0xff5A483F),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseFirestore.instance.collection("board").doc(title).set({
                "title": title,
                "category": category,
                "contents": contents,
                "writer": user!.displayName,
                "date": DateFormat('yyyy.MM.dd').format(now),
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: kTextFieldDecoration.copyWith(hintText: "제목"),
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            decoration: kTextFieldDecoration.copyWith(hintText: "말머리"),
            onChanged: (value) {
              category = value;
            },
          ),
          TextField(
            decoration: kTextFieldDecoration.copyWith(hintText: "내용"),
            onChanged: (value) {
              contents = value;
            },
          ),
        ],
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
