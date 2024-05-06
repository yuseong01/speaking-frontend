import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/lecture/each_talking_lecture.dart';
import 'package:mal_hae_bol_le/lecture/record.dart';


//채팅 페이지
class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lecture Translate'),
        backgroundColor: Colors.pink[200],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: EachTalkingLecture(),),
            Record(),
          ],
        ),
      )
    );
  }
}
