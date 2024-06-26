import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/home/home.dart';
import 'package:mal_hae_bol_le/lecture/lecture_screen.dart';
import 'package:mal_hae_bol_le/login/sign_in.dart';

class LectureButton extends StatelessWidget {
  LectureButton({super.key});

  @override
  Widget build(BuildContext context) {
    // clubs 리스트 가져옴

    return GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 9/10,
        children: List.generate(10,
                (index) => CardButton(context, index)));
  }
}

Widget CardButton(BuildContext context, int index) {
  return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LectureScreen()),
        );
      },
      child: Container(
        width: 170,
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Stack(children: [
                    Positioned(
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThpE4yb5W6LrVp5iG4s4yD6awCwJGPcTavXw&usqp=CAU',
                        width: MediaQuery.of(context).size.width/5*2,
                        height: MediaQuery.of(context).size.height/5*1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: MediaQuery.of(context).size.width/5*2,
                            height: MediaQuery.of(context).size.height/5*1,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white10,
                                    Colors.white,
                                  ],
                                )),
                          ),
                        )),
                    Positioned(
                        child: Container(
                          width: MediaQuery.of(context).size.width/5*2,
                          height: MediaQuery.of(context).size.height/5*1,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.05),
                                    Colors.white.withOpacity(0.1)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        )),
                    Positioned(
                        top: 140,
                        left: 10,
                        child: Text(
                          '강의 이름',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  '주제',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ));
}
