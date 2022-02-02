import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/document_view.dart';

class ResultScreen extends StatefulWidget {
  final String index;
  ResultScreen(this.index);
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> currentStream;
  List<String> menuIndex = ["전체 보기", "공지사항", "꿀팁", "소식"];
  @override
  void initState() {
    super.initState();
    switch (widget.index) {
      case "all":
        {
          currentStream = firestore
              .collection("board")
              .orderBy("date", descending: true)
              .snapshots();
          break;
        }
      case "notice":
        {
          currentStream = firestore
              .collection("board")
              .where("category", isEqualTo: "공지사항")
              .orderBy("date", descending: true)
              .snapshots();
          break;
        }
      case "tip":
        {
          currentStream = firestore
              .collection("board")
              .where("category", isEqualTo: "꿀팁")
              .orderBy("date", descending: true)
              .snapshots();
          break;
        }
      case "news":
        {
          currentStream = firestore
              .collection("board")
              .where("category", isEqualTo: "소식")
              .orderBy("date", descending: true)
              .snapshots();
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시판"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String choice) {
              if (choice == "전체 보기") {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              } else if (choice == "공지사항") {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'a', (route) => false);
              } else if (choice == "꿀팁") {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'b', (route) => false);
              } else if (choice == "소식") {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'c', (route) => false);
              }
            },
            itemBuilder: (BuildContext context) {
              return menuIndex
                  .map((choice) =>
                      PopupMenuItem(value: choice, child: Text(choice)))
                  .toList();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: currentStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          List<DocumentSnapshot> docs = snapshot.data.docs;
          return ListView(
            padding: EdgeInsets.only(top: 20.0),
            children:
                docs.map((eachDocument) => DocumentView(eachDocument)).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'd');
        },
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
      ),
    );
  }
}
