import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, 
      child: Container( 
        height: 50, 
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget> [
            // tab 4개 존재

            Tab(
              icon: Icon( Icons.home, size: 18,),  // 아이콘 지정
              child: Text('홈', style: TextStyle(fontSize: 9),),
            ),

            Tab(
              icon: Icon( Icons.note, size: 18,),
              child: Text('게시판', style: TextStyle(fontSize: 9),),
            ),

            Tab(
              icon: Icon( Icons.favorite, size: 18,),
              child: Text('즐겨찾기', style: TextStyle(fontSize: 9),),
            ),

            Tab(
              icon: Icon( Icons.person, size: 18,),
              child: Text('마이페이지', style: TextStyle(fontSize: 9),),
            ),
          ]
        )
      )
    );
  }
}