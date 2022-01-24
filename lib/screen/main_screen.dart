import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/screen/login_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static final String pageName = 'MyHomePage';

  const MyHomePage({Key? key, required this.title, required this.email})
      : super(key: key);

  final String email;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("logout"),
          ),
        ),
      ),
    );
  }
}
