import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/src/asset_manifest.dart';
import 'package:flutter/src/services/asset_manifest.dart';



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
      designSize: const Size(1280 , 832),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yellow Box',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: LoginPage(),
        home: MainMenuPage(),
      ),
    );
  }
}
