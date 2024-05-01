import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/lecture/lecture_button.dart';

class LectureRecommend extends StatelessWidget {
  const LectureRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        ListTile(
          title: SearchBar(
            leading: Icon(
              Icons.search,
              color: Colors.purple,
            ),
            hintText: 'search',
            hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.black26,fontSize: 15)),
            elevation: MaterialStateProperty.all(0),
            constraints: const BoxConstraints(
              maxHeight: 40,
            ),
            onChanged: (value) {
            },
          ),
          tileColor: Colors.purple,
        ),
        Container(
          color: Colors.purple,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    //todo 최근 활동 동아리
                    '추천 강의',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
