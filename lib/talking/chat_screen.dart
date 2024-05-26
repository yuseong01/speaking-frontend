import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/talking/each_talking.dart';
import 'package:mal_hae_bol_le/talking/new_talking.dart';

//채팅 페이지
class ChatScreen extends StatefulWidget {
  final String roomNumber;
  const ChatScreen({super.key,required this.roomNumber});

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
          backgroundColor: Colors.grey[900],
        ),
        body: Container(
          color: Colors.grey[800],
          child: Column(
            children: [
              Expanded(
                child: EachTalking(roomNumber: widget.roomNumber,),
              ),
              NewTalking(roomNumber: widget.roomNumber,),
            ],
          ),
        ));
  }
}
