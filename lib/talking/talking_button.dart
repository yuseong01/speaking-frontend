import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/home/home.dart';
import 'package:mal_hae_bol_le/main.dart';
import 'package:mal_hae_bol_le/talking/chat_screen.dart';
import 'package:mal_hae_bol_le/talking/each_talking.dart';


class TalkingButton extends StatelessWidget {
  TalkingButton({super.key});

  @override
  Widget build(BuildContext context) {
    // clubs 리스트 가져옴

    return GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 6/7,
        children: List.generate(10,
                (index) => CardButton(context, index)));
  }
}

Widget CardButton(BuildContext context, int index) {
  return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
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
                        'https://static.vecteezy.com/system/resources/previews/005/337/802/non_2x/icon-symbol-chat-outline-illustration-free-vector.jpg',
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: 170,
                            height: 170,
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
                          width: 170,
                          height: 170,
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
                          '대화',
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
                  '대화',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ));
}
