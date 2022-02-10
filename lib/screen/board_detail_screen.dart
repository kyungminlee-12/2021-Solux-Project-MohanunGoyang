import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mohanun_goyang/screen/result_screen.dart';
import 'package:mohanun_goyang/screen/add_screen.dart';

import 'document_view.dart';

class BoardDetailScreen extends StatefulWidget {
  final DocumentSnapshot documentData;
  BoardDetailScreen(this.documentData);

  @override
  _BoardDetailScreenState createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends State<BoardDetailScreen> {
  late Stream<QuerySnapshot> currentStream;
  late String contents;
  User? user = FirebaseAuth.instance.currentUser;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    currentStream = FirebaseFirestore.instance
        .collection("comment")
        .where("docTitle", isEqualTo: widget.documentData["title"])
        .orderBy("date", descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: statusBar + size.height * 0.04,
                bottom: size.height * 0.02,
                left: size.width * 0.06,
                right: size.width * 0.06,
              ),
              child: Text(
                widget.documentData["title"],
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * 0.016,
                left: size.width * 0.06,
                right: size.width * 0.06,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/image.jpeg"),
                    radius: 14,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    widget.documentData["writer"],
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.022,
                bottom: size.height * 0.03,
                left: size.width * 0.06,
                right: size.width * 0.06,
              ),
              child: Text(
                widget.documentData["contents"],
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(
              thickness: 0.4,
              color: Colors.grey,
            ),
            _commentWidget(size, "냥냥펀치", "꿀팁 감사합니다~!"),
            _commentWidget(size, "캣톨릭", "좋은 내용이네요 :)"),
          ],
        ),
      ),
      bottomNavigationBar:
          _insertCommentWidget(size, widget.documentData["title"]),
    );
  }

  Widget _insertCommentWidget(Size size, String docTitle) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("comment")
                    .doc(docTitle)
                    .set({
                  "docTitle": docTitle,
                  "contents": contents,
                  "writer": user!.displayName,
                  "date": DateFormat('yyyy.MM.dd').format(now),
                });
              },
              icon: Icon(Icons.send_rounded),
            ),
          ),
        ),
      ],
    );
  }

  Widget _commentWidget(Size size, String writer, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/image.jpeg"),
                radius: 10,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                writer,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
