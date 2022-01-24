import 'package:flutter/material.dart';
import 'package:mohanun_goyang/screen/home_screen.dart'; 
import 'package:mohanun_goyang/widget/bottom_bar.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '뭐하는 고양',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ) ,
      home: DefaultTabController(
        length: 4,   // tab 간의 길이 
        child: Scaffold(
          body: TabBarView(
            // 사용자가 직접 손가락으로 스크롤 하는 것 막음 
            physics: NeverScrollableScrollPhysics(), 
            children: <Widget> [
              HomeScreen(),
              //Container(),
              Container(),
              Container(),
              Container(),
              // HomeScreen(),
              // Container(child: Center(child: Text('home'),),),
              // Container(child: Center(child: Text('search'),),),
              // Container(child: Center(child: Text('save'),),),
              // Container(child: Center(child: Text('more'),),),
              // MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),  // widget 폴더 안에다 bottom 코딩하기 
        ),
      ),
    );
  }
}