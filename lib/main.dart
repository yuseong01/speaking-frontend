import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mal_hae_bol_le/lecture.dart';

Future main() async {
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
      home: Scaffold(
        body: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  centerTitle: false,
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'pictures/image/logo.png',
                    ),
                  ),
                  title: const Text(
                    '동아줄 ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.orange[800],
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
                        '오늘의 동아리',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '탐색',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 190),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [TodaysClub()],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
