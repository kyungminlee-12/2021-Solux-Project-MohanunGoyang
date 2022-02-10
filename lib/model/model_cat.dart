class CatInfo { 
  // 모델을 만들어 영화 데이터 관리 
  
  final String name;
  final String location;
  final bool neutering;  // 중성화 여부 
  final String picture;
  final String date;
  final String gender;
  final String age;
  final bool like;
  final String characteristic;
  final String comment;
  final String commentDate;
  final String comment2;
  final String commentDate2;

  CatInfo.fromMap(Map<String, dynamic> map) 
  : name=map['name'],
    location=map['location'],
    neutering=map['neutering'],
    picture=map['picture'],
    date=map['date'],
    gender=map['gender'],
    age=map['age'],
    like=map['like'],
    characteristic=map['characteristic'],
    comment=map['comment'],
    commentDate=map['commentDate'],
    comment2=map['comment2'],
    commentDate2=map['commentDate2'];
}
