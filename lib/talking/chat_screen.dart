import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/talking/each_talking.dart';
import 'package:mal_hae_bol_le/talking/new_talking.dart';

//채팅 페이지
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Free Talking'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: EachTalking(),),
            NewTalking(),
          ],
        ),
      )
    );
  }
}
