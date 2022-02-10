import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/screen/detail_screen.dart';
import 'package:mohanun_goyang/model/model_cat.dart';

class CarouselImage extends StatefulWidget {
  final List<CatInfo> cat;
  final int cat_index;
  CarouselImage({required this.cat, required this.cat_index});    // constructor를 통해 movies를 갖고오기 
  _CarouselImageState createState() => _CarouselImageState();
}
class _CarouselImageState extends State<CarouselImage> {
  late List<CatInfo> cat;
  // late List<Widget> picture;
  late List<String> picture;
  late List<String> name;
  late List<String> location;
  late List<String> date;
  late List<bool> neutering;
  late List<bool> like;

  //late int cat_index;
  bool like_state=false;
  var _icon=Icons.favorite;
  int _currentPage=0; 
  late String _currentpicture;
  late String _currentdate;
  late String _currentname;
  late String _currentlocation;
  late bool _currentneutering;
  late bool _currentlike;

  @override
  void initState() {
    super.initState();
    cat=widget.cat;
    // images=cat.map((m) => Image.asset('./images/'+m.picture)).toList();
    // images=cat.map((m) => Image.asset('images/'+m.picture)).toList();
    picture=cat.map((m) => m.picture).toList();
    name=cat.map((m) => m.name).toList();
    location=cat.map((m) => m.location).toList();
    date=cat.map((m) => m.date).toList();
    neutering=cat.map((m) => m.neutering).toList();
    like=cat.map((m) => m.like).toList();
    _currentPage=widget.cat_index;
    //cat_index=0;

    //_currentimage=date[_currentPage];
    _currentpicture=picture[_currentPage];
    _currentdate=date[_currentPage];
    _currentname=name[_currentPage];
    _currentlocation=location[_currentPage];
    _currentneutering=neutering[_currentPage];
    _currentlike=like[_currentPage];
  }

  @override 
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.fromLTRB(5, 5, 5, 0),),
          Container(
            // child: Image.asset('images/cat1.jpg'),  
            child: Image.asset('images/'+_currentpicture),  
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

                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(children: <Widget>[
                        IconButton(
                          icon: _currentneutering ? Icon(Icons.favorite) : Icon(Icons.favorite_border), 
                          onPressed: () {
                            setState(() {
                              if (_currentlike==true) _currentlike=false;
                              else _currentlike=true;
                            });
                          },
                        ),
                        Text('좋아요', style: TextStyle(fontSize: 11),)
                      ],),
                    ),
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
                          _currentneutering   // neutering(likes)의 current page가 true면 check, false면 add 형태
                          ? IconButton(onPressed: () {}, icon: Icon(Icons.check),)
                          : IconButton(onPressed: () {}, icon: Icon(Icons.close_sharp),),
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
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 500,
            child: Divider(
              color: Color(0xff5A483F), 
              thickness: 2.0
            )
          ),
      ],),
      
    );
  }

  void _click() {
    if(_icon == Icons.favorite) {
      _icon=Icons.favorite_border;
    } else {
      _icon = Icons.favorite;
    }
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






