import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mal_hae_bol_le/lecture/chat_bubble_lecture.dart';

class EachTalkingLecture extends StatelessWidget {
  const EachTalkingLecture({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('lecture')
          .orderBy(
            'time',
            descending: true,
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
              return ChatBubbleLecture(chatDocs[index]['comment'],
                  );
            });
      },
    );
  }
}
