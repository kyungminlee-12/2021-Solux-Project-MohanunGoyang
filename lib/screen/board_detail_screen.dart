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
                // "그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자.그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자. 그냥 개최국 중국이 메달 모두 가져가라고 하자.",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Divider(
              thickness: 0.4,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CommentWidget(size, widget.documentData["title"]),
    );
  }
}

Widget CommentWidget(Size size, String docTitle) {
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
                  .collection("board")
                  .doc(docTitle)
                  .update({"comments": "comment 내용"});
            },
            icon: Icon(Icons.send_rounded),
          ),
        ),
      ),
    ],
  );
}
