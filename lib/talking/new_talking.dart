import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewTalking extends StatefulWidget {
  final String roomNumber;
  const NewTalking({super.key, required this.roomNumber});
  @override
  State<NewTalking> createState() => _NewTalkingState();
}

class _NewTalkingState extends State<NewTalking> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  Future<void> _sendMessage() async {
    _stopListening();
    FocusScope.of(context).unfocus();

    final user = FirebaseAuth.instance.currentUser;
    if (_lastWords != null && user != null) {
      DocumentReference userDoc = FirebaseFirestore.instance.collection('chat').doc(user.uid);
      DocumentReference roomDoc = userDoc.collection('rooms').doc(widget.roomNumber.toString());

      final docSnapshot = await roomDoc.get();
      if (!docSnapshot.exists) {
        await roomDoc.set({
          'room': widget.roomNumber,
        });
      }

      CollectionReference messagesCollection = roomDoc.collection('message');
      await messagesCollection.add({
        'time': Timestamp.now(),
        'comment': _lastWords,
        'language': 1,
        'split': 1,
      });

      // Clear the last words after sending
      setState(() {
        _lastWords = '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Recognized words:',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            _speechToText.isListening
                ? '$_lastWords'
                : _speechEnabled
                ? 'Tap the microphone to start listening...'
                : 'Speech not available',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed:
            _speechToText.isNotListening ? _startListening : _lastWords == '' ? _stopListening :_sendMessage,
            tooltip: 'Listen',
            icon: Icon(
              _speechToText.isNotListening ? Icons.mic : Icons.mic_off,
              size: 30,
              color: Colors.white,
            ),
          )
        ]),
      ]),
    );
  }
}
