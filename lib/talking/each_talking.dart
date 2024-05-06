import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mal_hae_bol_le/talking/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EachTalking extends StatelessWidget {
  const EachTalking({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'time',
          )
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return ChatBubble(chatDocs[index]['comment'],
                  chatDocs[index]['split'] == 1);
            });
      },
    );
  }
}
