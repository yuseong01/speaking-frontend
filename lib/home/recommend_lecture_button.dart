import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/talking/chat_screen.dart';


class LectureRecommendButton extends StatelessWidget {
  LectureRecommendButton({super.key});

  @override
  Widget build(BuildContext context) {

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
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width/5*2,
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
                        'https://i.ytimg.com/vi/dM1dWUQm3uE/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLA2GAo0-7oGNgwiNh8OpdUZacg3Xw',
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
                          '주제',
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
                  '차시',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ));
}
