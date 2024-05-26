import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChatBubble extends StatefulWidget {

  const ChatBubble(this.message, this.isMe, {super.key});
  final String message;
  final bool isMe;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  final FlutterTts tts = FlutterTts();



  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
    TextEditingController(text: widget.message);
    return Row(
      mainAxisAlignment: widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.isMe ? Colors.grey : Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: widget.isMe ? Radius.circular(0) : Radius.circular(12),
                bottomLeft: widget.isMe ? Radius.circular(12) : Radius.circular(0),
              )),
          width: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            widget.message,
            style: TextStyle(color: widget.isMe ? Colors.black : Colors.white),
          ),
        ),
        IconButton(onPressed: (){tts.speak(controller.text);}, icon: Icon(Icons.speaker))
      ],
    );
  }
}
