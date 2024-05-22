import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/lecture/lecture_button.dart';

//강의요약
class Lecture extends StatelessWidget {
  const Lecture({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [

        Container(
          color: Colors.grey[900],
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.blueGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    //todo 최근 활동 동아리
                    'List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                LectureButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
