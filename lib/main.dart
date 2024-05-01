import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/home/home.dart';
import 'package:mal_hae_bol_le/lecture/lecture.dart';
import 'package:mal_hae_bol_le/login/sign_in.dart';
import 'package:mal_hae_bol_le/talking/talking.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  bool isScrolled = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: false,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      icon: Icon(Icons.account_box_rounded),
                      color: Colors.white,
                    ),
                  ],
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                        'https://img.freepik.com/premium-vector/vector-illustration-of-cute-horse-cartoon-waving-isolated-on-white-background_769891-51.jpg'),
                  ),
                  title: const Text(
                    '말해볼래 ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.purple,
                  shadowColor: Colors.orangeAccent,
                  bottom: const TabBar(
                    isScrollable: true,
                    indicatorWeight: 2.0,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    // labelPadding: EdgeInsets.all(6),
                    padding: EdgeInsets.all(3),
                    tabs: [
                      Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Talking',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Lecture',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 190),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [LectureRecommend(), Talking(), Lecture()],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
