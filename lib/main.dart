import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/src/asset_manifest.dart';
import 'package:intern_yellow_box/Menu/CycleMenu.dart';
import 'package:intern_yellow_box/Menu/reportMenu.dart';
import 'package:intern_yellow_box/test.dart';
import 'Login.dart';
import 'Menu/Manu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920,1080),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yellow Box',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),//
        //home: MainMenuPage(),
        //home: CycleMenuPage('ZEEN','admin','1234'),
       // home: ReportPage(),
        //home: HomeScreen(),
      ),
    );
  }
}
