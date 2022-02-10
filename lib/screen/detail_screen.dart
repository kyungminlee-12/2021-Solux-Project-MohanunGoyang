import 'package:flutter/material.dart';
import 'package:mohanun_goyang/model/model_cat.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  final CatInfo cat;
  DetailScreen({required this.cat});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like=false;
  @override
  void initState() {
    super.initState();
    like=widget.cat.neutering;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Container(
      child: SafeArea(
        child: ListView(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.maxFinite,

                /*
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/'+widget.cat.picture),
                    fit: BoxFit.cover,
                  ),
                ),
                */

                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      // alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.1),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Image.asset('images/cat2.jpg'),
                            Container(
                              padding: EdgeInsets.only(top: 50),
                              child: CircleAvatar(radius: 100, backgroundImage: AssetImage('images/'+widget.cat.picture),),
                            ),
                            /*
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                              child: Image.asset('images/cat1.jpg'),
                              height: 550,
                            ),
                            */
                           
                            //Container( padding: EdgeInsets.all(7),  child: Text(  '99% 일치 2019 15+ 시즌 1개',   textAlign: TextAlign.center,    style: TextStyle(fontSize: 13),   ),),
                            
                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(7),
                                    child: Text(
                                      widget.cat.name,          // 고양이 이름 
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                              ],)
                            ),
                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(7),
                                    child: Text(
                                      "성별: "+widget.cat.gender,    // 성별
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                              ],)
                            ),

                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(7),
                                    child: Text(
                                      "추정 나이: "+widget.cat.age,  
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                              ],)
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(7, 0, 0, 0),  // 공백 조금 생성하기
                              //padding: EdgeInsets.all(7),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.left,
                                children: <Widget>[
                                  Text("중성화 여부: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                                  widget.cat.neutering   // neutering(likes)의 current page가 true면 check, false면 add 형태
                                  ? IconButton(onPressed: () {}, icon: Icon(Icons.check),)
                                  : IconButton(onPressed: () {}, icon: Icon(Icons.close_sharp),),
                                ],
                              )
                            ),

                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Text(
                                    "영역: "+widget.cat.location,     
                                    textAlign: TextAlign.left,
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16,),
                                  ),
                                ),
                              ],)
                            ),

                            // 특징 
                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(7, 30, 0, 0),
                                  child: Text(
                                    "특징",
                                    textAlign: TextAlign.left,
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20,),
                                  ),
                                ),
                              ],)
                            ),
                            Container(
                              child: Row(children: <Widget>[
                                Container(
                                    padding: EdgeInsets.fromLTRB(7, 7, 7, 30),
                                    child: Text(
                                      "-  "+widget.cat.characteristic,    // 성별
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                              ],)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ),
              // appbar를 만드는 위젯, 닫기 버튼도 생성된다
              Positioned(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )
              ),
            ],
          ), 

          // 댓글 부분 
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text( 
                          widget.cat.comment, 
                          style: TextStyle(fontSize: 17, color: Colors.white) 
                        ),
                        Padding(padding: EdgeInsets.all(5),),
                        Text( 
                          widget.cat.commentDate, 
                          style: TextStyle(fontSize: 13, color: Colors.white60,) 
                        ),
                      ],
                    ),
                  )
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text( 
                          widget.cat.comment2, 
                          style: TextStyle(fontSize: 17, color: Colors.white) 
                        ),
                        Padding(padding: EdgeInsets.all(5),),
                        Text( 
                          widget.cat.commentDate2, 
                          style: TextStyle(fontSize: 13, color: Colors.white60,) 
                        ),
                      ],
                    ),
                  )
                ), 
              ],
            )
          ),
          Padding(padding: EdgeInsets.all(25),),

        ],),
      ),
    ));

  }
}

Widget makeMenuButton() {
  return Container();
}

