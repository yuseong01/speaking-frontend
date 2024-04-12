
import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/lecture_button.dart';

class TodaysClub extends StatelessWidget {
  const TodaysClub({super.key});
  @override
  Widget build(BuildContext context) {

    return ListView(

      physics: ClampingScrollPhysics(),
      children: [
        ListTile(
          title: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.orange[800],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '동아줄에 오신 것을 환영합니다!',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
          ),
          tileColor: Colors.orange[800],
        ),
        Container(
          color: Colors.orange[800],
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
                    ' 오늘의 동아리',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ButtonCurrent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
