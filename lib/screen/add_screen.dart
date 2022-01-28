import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late String title;
  late String contents;
  late String category;
  late String date;
  late String writer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("글쓰기")),
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
          TextField(
            decoration: kTextFieldDecoration.copyWith(hintText: "작성자"),
            onChanged: (value) {
              writer = value;
            },
          ),
          TextField(
            decoration: kTextFieldDecoration.copyWith(hintText: "날짜"),
            onChanged: (value) {
              date = value;
            },
          ),
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance.collection("board").doc(title).set({
                "title": title,
                "category": category,
                "contents": contents,
                "writer": writer,
                "date": date,
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(primary: Colors.brown),
            child: Text("완료"),
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
