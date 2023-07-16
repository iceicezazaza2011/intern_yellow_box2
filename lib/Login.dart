import 'package:flutter/material.dart';
import 'package:intern_yellow_box/uppercase.dart';
import 'Menu/Manu.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_yellow_box/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController Org = TextEditingController();
  final TextEditingController Name = TextEditingController();
  final TextEditingController Password = TextEditingController();
  bool _isNameTextNotEmpty = false;
  bool _isOrgTextNotEmpty = false;

  bool obscureText = true;
  Widget? _messageWidget;
  String inputValueorg = "";

  void _OrgclearText() {
    Org.clear();
    setState(() {
      _isOrgTextNotEmpty = false;
    });
  }

  void _nameclearText() {
    Name.clear();
    setState(() {
      _isNameTextNotEmpty = false;
    });
  }

  @override
  void dispose() {
    Name.dispose();
    super.dispose();
  }

  void login(BuildContext context) {
    String name = Name.text.trim();
    String password = Password.text.trim();
    String org = Org.text.trim();

    if (name.isEmpty || password.isEmpty) {
      setState(() {
        _messageWidget = buildMessageWidget(
            'กรุณากรอก  ชื่อผู้ใช้ หรือ รหัสผ่าน', Colors.red);
      });
    } else if (name != 'admin' || password != '1234' ) {
      setState(() {//
        _messageWidget = buildMessageWidget(
            'ชื่อผู้ใช้ หรือ รหัสผ่านไม่ถูกต้อง', Colors.red);
      });
    } else {
      setState(() {
        _messageWidget = null;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainMenuPage(),
        ),
      );
    }
  }

  Widget buildMessageWidget(String message, Color color) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            message,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginoFP (9:64)
        padding: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // frame1Ezu (9:65)
              width: 912*fem,
              height: 1080*fem,
              decoration: BoxDecoration (
                color: Color(0xffe5e5e5),
              ),
              child: Align(
                // womanprotectingherselfagainstc (9:66)
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 912*fem,
                  height: 1080*fem,
                  child: Image.asset(
                    'assets//images/Woman.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              // frame2qjo (9:67)
              padding: EdgeInsets.fromLTRB(192*fem, 132*fem, 200*fem, 100*fem),
              width: 1000*fem,
              height: 1080*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // zeenlogoen1jaH (9:77)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 72*fem),
                    width: 616.61*fem,
                    height: 238*fem,
                    child: Image.asset(
                      'assets/images/zeenlogoen-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // usernamedff (9:78)
                    margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 26.61*fem, 32*fem),
                    padding: EdgeInsets.fromLTRB(24*fem, 14*fem, 24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Text(
                      'ORG',
                      style: SafeGoogleFont (
                        'Kanit',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495*ffem/fem,
                        color: Color(0xff717171),
                      ),
                    ),
                  ),
                  Container(
                    // usernameCsB (9:68)
                    margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 26.61*fem, 32*fem),
                    padding: EdgeInsets.fromLTRB(24*fem, 14*fem, 24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Text(
                      'Username',
                      style: SafeGoogleFont (
                        'Kanit',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495*ffem/fem,
                        color: Color(0xff717171),
                      ),
                    ),
                  ),
                  Container(
                    // passwardfEy (9:74)
                    margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 26.61*fem, 64*fem),
                    padding: EdgeInsets.fromLTRB(24*fem, 14*fem, 24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Text(
                      'Passward',
                      style: SafeGoogleFont (
                        'Kanit',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495*ffem/fem,
                        color: Color(0xff717171),
                      ),
                    ),
                  ),
                  Container(
                    // loginJoj (9:71)
                    margin: EdgeInsets.fromLTRB(224*fem, 0*fem, 224.61*fem, 0*fem),
                    width: double.infinity,
                    height: 64*fem,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfffa7003),
                      borderRadius: BorderRadius.circular(8*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: SafeGoogleFont (
                          'Kanit',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.495*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
