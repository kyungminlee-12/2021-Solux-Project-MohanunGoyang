import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohanun_goyang/screen/result_screen.dart';
import 'package:mohanun_goyang/screen/add_screen.dart';

class BoardScreen extends StatefulWidget {
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffFAFAFA)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ResultScreen("all"),
        'a': (context) => ResultScreen("notice"),
        'b': (context) => ResultScreen("tip"),
        'c': (context) => ResultScreen("news"),
        'd': (context) => AddScreen(),
      },
    );
  }
}
