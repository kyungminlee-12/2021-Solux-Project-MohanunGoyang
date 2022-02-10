import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/result_screen.dart';
import 'package:mohanun_goyang/screen/add_screen.dart';

class BoardDetailScreen extends StatefulWidget {
  final DocumentSnapshot documentData;
  BoardDetailScreen(this.documentData);

  @override
  _BoardDetailScreenState createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends State<BoardDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
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
          Divider(
            thickness: 0.4,
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.022,
                  bottom: size.height * 0.04,
                  left: size.width * 0.06,
                  right: size.width * 0.06,
                ),
                child: Text(
                  widget.documentData["contents"],
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
