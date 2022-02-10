import 'package:flutter/material.dart';
import 'package:mohanun_goyang/model/model_cat.dart';
import 'package:mohanun_goyang/widget/carousel_slider.dart'; 

class HomeScreen extends StatefulWidget {
  final List<CatInfo> cat;
  HomeScreen({required this.cat}); 
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CatInfo> cat;

  @override
  void initState() {
    cat=widget.cat;
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff5A483F),
          title: Text("서울시 용산구 청파동"),
          elevation: 0.0,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          ListTile(
            // leading : Image.asset('images/cat1.jpg'),
            title: CarouselImage(cat: cat, cat_index: 0,),
            // trailing : Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: CarouselImage(cat: cat, cat_index: 1,),
            onTap: () {},
          ),
          ListTile(
            title: CarouselImage(cat: cat, cat_index: 2,),
            onTap: () {},
          ),
          ListTile(
            title: CarouselImage(cat: cat, cat_index: 3,),
            onTap: () {},
          ),
        ]));
 
  }
}