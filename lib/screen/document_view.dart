import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/board_detail_screen.dart';

class DocumentView extends StatelessWidget {
  final DocumentSnapshot documentData;
  DocumentView(this.documentData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BoardDetailScreen(documentData)),
            );
          },
          title: Text(
              "[" + documentData["category"] + "] " + documentData["title"]),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(documentData["writer"].toString()),
              SizedBox(width: 10, height: 10),
              Text(documentData["date"].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
