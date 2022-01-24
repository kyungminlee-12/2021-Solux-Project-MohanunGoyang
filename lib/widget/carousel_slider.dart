import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/screen/detail_screen.dart';
import 'package:mohanun_goyang/model/model_cat.dart';

class CarouselImage extends StatefulWidget {
  final List<CatInfo> cat;
  CarouselImage({required this.cat});    // constructor를 통해 movies를 갖고오기 
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<CatInfo> cat;
  late List<Widget> images;
  late List<String> name;
  late List<String> location;
  late List<String> date;
  late List<bool> neutering;
  late List<bool> like;
  
  int _currentPage=0; 

  late String _currentdate;
  late String _currentname;
  late String _currentlocation;
  late bool _currentneutering;
  late bool _currentlike;

  @override
  void initState() {
    super.initState();
    cat=widget.cat;
    images=cat.map((m) => Image.asset('./images/'+m.picture)).toList();
    name=cat.map((m) => m.name).toList();
    location=cat.map((m) => m.location).toList();
    date=cat.map((m) => m.date).toList();
    neutering=cat.map((m) => m.neutering).toList();
    like=cat.map((m) => m.like).toList();

    _currentdate=date[0];
    _currentname=name[0];
    _currentlocation=location[0];
    _currentneutering=neutering[0];
    _currentlike=like[0];
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(5),),
          Container(
            child: Image.asset('images/cat1.jpg'),  
            height: 200,
            width: 200,
          ),
  
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(children: <Widget>[
                    like[_currentPage]   // neutering(likes)의 current page가 true면 check, false면 add 형태
                    ? IconButton(onPressed: () {}, icon: Icon(Icons.favorite),)
                    : IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border),),
                    Text('좋아요', style: TextStyle(fontSize: 11),)
                  ],),
                ),
                
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(children: <Widget>[
                    Padding(padding: EdgeInsets.all(3),),
                    Text(_currentname, style: TextStyle(fontSize: 15),),
                    Padding(padding: EdgeInsets.all(3),),
                    Text("지역: "+_currentlocation, style: TextStyle(fontSize: 11),),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text("중성화 여부: ", style: TextStyle(fontSize: 11),),
                          neutering[_currentPage]   // neutering(likes)의 current page가 true면 check, false면 add 형태
                          ? IconButton(onPressed: () {}, icon: Icon(Icons.check),)
                          : IconButton(onPressed: () {}, icon: Icon(Icons.no_accounts),),
                        ],
                      )
                    ),

                    Text("최근 수정일: "+_currentdate, style: TextStyle(fontSize: 11),),   
                  ],),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.info), 
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                        fullscreenDialog: true, 
                        builder: (BuildContext context) {
                          return DetailScreen( cat: cat[_currentPage],);
                        }));
                      }
                    ),
                    Text('정보', style: TextStyle(fontSize: 11), ),
                  ],),
                ),
            ],),
          ),
      ],),
    );
  }
}


List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results=[];
  for (var i=0; i<list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle, 
          color: _currentPage==i
           ? Color.fromRGBO(255, 255, 255, 0.9)
           : Color.fromRGBO(255, 255, 255, 0.4)
        ),
      )
    );
  }
  return results;
}



