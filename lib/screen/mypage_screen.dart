import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/result_screen.dart';
import 'package:mohanun_goyang/screen/add_screen.dart';

import 'myboard_screen.dart';

class MyPageScreen extends StatefulWidget {
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/image.jpeg"),
              radius: 80,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              user!.displayName.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(180, 20), side: BorderSide(width: 1.5)),
                  child: Text(
                    "회원 정보 조회",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyBoardScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(180, 20), side: BorderSide(width: 1.5)),
                  child: Text(
                    "내가 작성한 글",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(180, 20), side: BorderSide(width: 1.5)),
                  child: Text(
                    "내가 작성한 댓글",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(180, 20), side: BorderSide(width: 1.5)),
                  child: Text(
                    "로그아웃",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
