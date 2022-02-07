import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/provider/join_or_login_notifier.dart';
import 'package:mohanun_goyang/screen/board_screen.dart';
import 'package:mohanun_goyang/screen/home_screen.dart';
import 'package:mohanun_goyang/screen/main_screen.dart';
import 'package:mohanun_goyang/screen/auth_screen.dart';
import 'package:mohanun_goyang/screen/mypage_screen.dart';
import 'package:mohanun_goyang/screen/setProfile_screen.dart';
import 'package:mohanun_goyang/screen/favorites_screen.dart';
import 'package:mohanun_goyang/widget/bottom_bar.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffFAFAFA)),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  // final userReference = FirebaseFirestore.instance.collection('users');
  // User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ChangeNotifierProvider<JoinOrLogin>.value(
              value: JoinOrLogin(),
              child: AuthScreen(),
            );
            // } else if (snapshot.data.displayName == null) {
            //   return setProfile();
          } else {
            // return MyHomePage(title: '모하는고양', email: snapshot.data!.email);
            return DefaultTabController(
              length: 4, // tab 간의 길이
              child: Scaffold(
                body: TabBarView(
                  // 사용자가 직접 손가락으로 스크롤 하는 것 막음
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    HomeScreen(),
                    BoardScreen(),
                    Container(),
                    MyPageScreen(),
                  ],
                ),
                bottomNavigationBar: Bottom(), // widget 폴더 안에다 bottom 코딩하기
              ),
            );
          }
        });
  }
}
