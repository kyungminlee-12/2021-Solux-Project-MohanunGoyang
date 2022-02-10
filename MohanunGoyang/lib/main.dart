 
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/provider/join_or_login_notifier.dart'; 
import 'package:mohanun_goyang/screen/board_screen.dart';
import 'package:mohanun_goyang/screen/home_screen.dart';
import 'package:mohanun_goyang/model/model_cat.dart';
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

  List<CatInfo> cat = [
    CatInfo.fromMap({
      'name': '햇살이',
      'location': '숙명여대 캠퍼스',
      'neutering': true,
      'picture': 'cat1.jpg',
      'date': '2021.01.14',
      'gender': 'male',
      'age': '모름',
      'like': true,
      'characteristic': '사람 손을 잘 타요',
      'comment': '오후 4시 명신관에서 밥 줬습니다~~',
      'commentDate': '2021.11.12',
      'comment2': '오늘 2시에 밥을 줬는데 잘 안 먹어요... 햇살이 아픈가요??',
      'commentDate2': '2022.01.05'
    }),
    CatInfo.fromMap({
      'name': '부바',
      'location': '숙명여대 캠퍼스', 
      'neutering': false,
      'picture': 'cat2.jpg',
      'date': '2021.01.15',
      'gender': 'female',
      'age': '모름',
      'like': false,
      'characteristic': '주로 햇살이와 함께 다님',
      'comment': '부바가 요즘 아픈 것 같아요!! 밥을 잘 안 먹어요...',
      'commentDate': '2022.01.01',
      'comment2': '오후 4시 명신관에서 밥 줬습니다!! 오늘은 밥 잘 먹어요!',
      'commentDate2': '2022.01.11'
    }),
    CatInfo.fromMap({ 
      'name': '주주',
      'location': '숙명여대 캠퍼스',
      'neutering': true,
      'picture': 'cat3.jpg',
      'date': '2021.01.16',
      'gender': 'male',
      'age': '모름',
      'like': true,
      'characteristic': '새 관찰을 좋아함',
      'comment': '혹시 주주 오늘 밥 주신 분 있으신기요?',
      'commentDate': '2022.02.12',
      'comment2': '11시에 명신관에서 밥 줬습니다!',
      'commentDate2': '2022.02.12'
    }),
    CatInfo.fromMap({
      'name': '니니',
      'location': '숙명여대 캠퍼스', 
      'neutering': false,
      'picture': 'cat4.jpg',
      'date': '2021.02.12',
      'gender': 'male',
      'age': '모름',
      'like': false,
      'characteristic': '사람이 만지는 것을 싫어함',
      'comment': '오전 10시 명신관에서 밥 줬습니다~~',
      'commentDate': '2021.12.17',
      'comment2': '오늘은 11시에 밥 줬습니다!',
      'commentDate2': '2022.02.18'
    }),
  ];


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
                    HomeScreen(cat: cat),
                    BoardScreen(),
                    LikeScreen(cat: cat),
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
