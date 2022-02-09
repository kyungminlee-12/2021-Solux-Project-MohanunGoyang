
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:mohanun_goyang/model/model_cat.dart';
import 'package:mohanun_goyang/screen/home_screen.dart';
import 'package:mohanun_goyang/widget/carousel_slider.dart'; 

class LikeScreen extends StatefulWidget {
  final List<CatInfo> cat;
  LikeScreen({required this.cat}); 
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  late List<CatInfo> cat;
  late List<bool> like;

  @override
  void initState() {
    super.initState();
    cat=widget.cat;
    like=cat.map((m) => m.like).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff5A483F),
          title: Text("서울시 용산구 청파동"),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Visibility(
            visible: like[0] ? false : true ,
            child: ListTile(
              // leading : Image.asset('images/cat1.jpg'),
              title: CarouselImage(cat: cat, cat_index: 0,),
              // trailing : Icon(Icons.navigate_next),
              onTap: () {},
            ),
          ),
          Visibility(
            visible: like[1] ? false : true ,
            child: ListTile(
              title: CarouselImage(cat: cat, cat_index: 1,),
              onTap: () {},
            ),
          ),
          Visibility(
            visible: like[2] ? false : true ,
            child: ListTile(
              title: CarouselImage(cat: cat, cat_index: 1,),
              onTap: () {},
            ),
          ),
          Visibility(
            visible: like[3] ? false : true ,
            child: ListTile(
              title: CarouselImage(cat: cat, cat_index: 1,),
              onTap: () {},
            ),
          ),
          
        
        ]));
  }
}
