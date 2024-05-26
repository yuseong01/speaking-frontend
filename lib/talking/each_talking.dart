import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mal_hae_bol_le/talking/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EachTalking extends StatelessWidget {
  final String roomNumber;
  EachTalking({super.key, required this.roomNumber});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(child: Text('Please log in to view the chat.'));
    }

    final userDoc = FirebaseFirestore.instance.collection('chat').doc(user.uid);

    return StreamBuilder(
      stream: userDoc
          .collection('rooms')
          .doc(roomNumber)
          .collection('message')
          .orderBy('time')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No messages yet.'));
        }

        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            return ChatBubble(
              chatDocs[index]['comment'],
              chatDocs[index]['split'] == 1,
            );
          },
        );
      },
    );
  }
}