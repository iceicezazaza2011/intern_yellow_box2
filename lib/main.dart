import 'dart:html';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Login.dart';

final Storage storage = html.window.localStorage;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yellow Box',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(), //
        //home: MainMenuPage(),
        //home: CycleMenuPage('ZEEN','admin','1234'),
        // home: ReportPage(),
        //home: HomeScreen(),
      ),
    );
  }
}
