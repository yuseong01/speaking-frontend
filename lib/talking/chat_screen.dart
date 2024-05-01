import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/talking/each_talking.dart';

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
        title: Text('Free Talking'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: EachTalking()),
          ],
        ),
      )
    );
  }
}
