import 'dart:ffi';

class LectureList {
  List<Lecture> list = [];

  LectureList({required this.list});
}

class Lecture {
  String? image;
  Int? level;
  String? link;
  String? title;

  Lecture({ this.image, this.level, this.link, this.title});

  Lecture.fromJson(Map<String, dynamic> json) {
    // json -> clubs class
    image = json['image'];
    level = json['level'];
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    // clubs class -> json
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['level'] = level;
    data['link'] = link;
    data['title'] = title;
    return data;
  }
}
