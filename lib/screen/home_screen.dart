import 'dart:html';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mohanun_goyang/model/model_cat.dart';
import 'package:mohanun_goyang/widget/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() { super.initState(); }
  List<CatInfo> cat=[
    CatInfo.fromMap(
      {
        'name': '햇살이',  
        'location': '숙명여대 캠퍼스',
        'neutering': true,
        'picture': 'cat.jpg', 
        'date': '2021.01.14',
        'gender': 'male',
        'age': '모름',
        'like': true,
        'characteristic': '사람 손을 잘 타요',
      }
    ),
    CatInfo.fromMap(
      {
        'name': '부바',
        'location': '숙명여대 캠퍼스',
        'neutering': false,
        'picture': 'cat.jpg',
        'date': '2021.01.15',
        'gender': 'female',
        'age': '모름',
        'like': false,
        'characteristic': '주로 햇살이와 함께 다님',
      }
    ),
    CatInfo.fromMap(
      {
        'name': '주주',
        'location': '숙명여대 캠퍼스',
        'neutering': true,
        'picture': 'cat.jpg',
        'date': '2021.01.16',
        'gender': 'male',
        'age': '모름',
        'like': true,
        'characteristic': '새 관찰을 좋아함',
      }
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("서울시 용산구 청파동"),
      ),
      body: ListView(
        scrollDirection : Axis.vertical,
        children : <Widget> [
          ListTile(
            // leading : Image.asset('images/cat1.jpg'),
            title : CarouselImage(cat: cat), 
            // trailing : Icon(Icons.navigate_next),
            onTap: (){},
          ),

          ListTile(
            // leading : Image.asset('images/cat1.jpg'),
            title : CarouselImage(cat: cat), 
            // trailing : Icon(Icons.navigate_next),
            onTap: (){},
          ),

          ListTile(
            // leading : Image.asset('images/cat1.jpg'),
            title : CarouselImage(cat: cat), 
            // trailing : Icon(Icons.navigate_next),
            onTap: (){},
          ),

          ListTile(
            // leading : Image.asset('images/cat1.jpg'),
            title : CarouselImage(cat: cat), 
            // trailing : Icon(Icons.navigate_next),
            onTap: (){},
          ),

        ]
      )
    );
  }

  // class 위젯 위에 topbar 위젯이 올라가 있음 
  /*
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[ 
        Stack(children: <Widget>[ CarouselImage(cat: cat), TopBar(),],), 
      ], 
    ); 
  }
  */

  /*
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp (
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      initialBinding: AppBinding(),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter!') ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () { Get.to(() => InfiniteScrollView()); }, 
                child: Text('Infinite Scroll View'),
              ), 
            ), 
          ],
        ),
      ),
    );
    */
   
    // return ListView(  children: <Widget>[ Stack(children: <Widget>[ InfiniteScrollView()],),],);
  //}
}

// 상단 부분 
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right:1),
            child: Text('서울시 용산구 청파동', style: TextStyle(fontSize: 14)),
          ),
      ],),
    );
  }
}

class AppBinding extends Bindings {
  @override 
  void dependencies() { Get.put(InfiniteScrollController()); }
}

// class InfiniteScrollController extends GetxController {
class InfiniteScrollController extends GetxController {
  var scrollController = ScrollController().obs;
  var data = <int>[].obs;
  var isLoading = false.obs;
  var hasMore = false.obs;

  @override
  void onInit() {
    _getData();

    this.scrollController.value.addListener(() {
      if (this.scrollController.value.position.pixels == this.scrollController.value.position.maxScrollExtent && this.hasMore.value) { 
        _getData(); 
      }
    });
    super.onInit();
  }
  _getData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    int offset = data.length;
    var appendData = List<int>.generate(10, (i) => i + 1 + offset);

    data.addAll(appendData);
    isLoading.value = false;
    hasMore.value = data.length < 30;
  }
  reload() async {
    isLoading.value = true;
    data.clear(); 
    await Future.delayed(Duration(seconds: 2));
    _getData();
  }
}

class InfiniteScrollView extends GetView<InfiniteScrollController> {

  List<CatInfo> cat=[
    CatInfo.fromMap(
      {
        'name': '햇살이',  
        'location': '숙명여대 캠퍼스',
        'neutering': true,
        'picture': 'cat1.jpg', 
        'date': '2021.01.14',
        'gender': 'male',
        'age': '모름',
        'like': true,
        'characteristic': '사람 손을 잘 타요',
      }
    ),
    CatInfo.fromMap(
      {
        'name': '부바',
        'location': '숙명여대 캠퍼스',
        'neutering': false,
        'picture': 'cat1.jpg',
        'date': '2021.01.15',
        'gender': 'female',
        'age': '모름',
        'like': false,
        'characteristic': '주로 햇살이와 함께 다님',
      }
    ),
    CatInfo.fromMap(
      {
        'name': '주주',
        'location': '숙명여대 캠퍼스',
        'neutering': true,
        'picture': 'cat1.jpg',
        'date': '2021.01.16',
        'gender': 'male',
        'age': '모름',
        'like': true,
        'characteristic': '새 관찰을 좋아함',
      }
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TopBar(),),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          controller: controller.scrollController.value,
          itemBuilder: (_, index) {
            print(controller.hasMore.value);
            if (index < controller.data.length) {
              var datum = controller.data[index];
              var like=true;

              // 박스 부분  
              return Material(
                elevation: 10.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile ( 
                    // leading: Icon(Icons.android_outlined),
                    title: CarouselImage(cat: cat),   // Text('$datum 번째 데이터'),
                    // trailing: Container( ),
                    onTap: () {  },
                  ),
                ),
              );
            }

            if (controller.hasMore.value || controller.isLoading.value) {
              return Center(child: RefreshProgressIndicator());
            }
            return Container(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    Text('데이터의 마지막 입니다'),
                    IconButton(
                      onPressed: () { controller.reload(); },
                      icon: Icon(Icons.refresh_outlined),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => Divider(),
          itemCount: controller.data.length + 1,
        ),
      ),),
    );
  }
}





