import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  void _sendMessage(){
    _stopListening();
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    if(_lastWords != null) {
      FirebaseFirestore.instance.collection('chat').add({
        'chat_id': 1,
        'time': Timestamp.now(),
        'comment': _lastWords,
        'language': 1,
        'room_id': 1,
        'split': 1,
        'user_id': user!.uid,
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

  /// Each time to start a speech recognition session
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
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            // If listening is active show the recognized words
            _speechToText.isListening
                ? '$_lastWords'
            // If listening isn't active but could be tell the user
            // how to start it, otherwise indicate that speech
            // recognition is not yet ready or not supported on
            // the target device
                : _speechEnabled
                ? 'Tap the microphone to start listening...'
                : 'Speech not available',
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed:
                _speechToText.isNotListening ? _startListening : _sendMessage,
            tooltip: 'Listen',
            icon:
                Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          )
        ]),
      ]),
    );
  }
}
