import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/provider/join_or_login_notifier.dart';
import 'package:mohanun_goyang/screen/main_screen.dart';
import 'package:mohanun_goyang/screen/auth_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ChangeNotifierProvider<JoinOrLogin>.value(
              value: JoinOrLogin(),
              child: AuthScreen(),
            );
          } else {
            return DefaultTabController(
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
        });
  }
}