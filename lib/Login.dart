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
      setState(() {
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1280;
    double baseHeight = 832;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fem = screenWidth / baseWidth;
    double ffem = fem * (baseHeight / baseWidth);

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                        width: 607 * fem,
                        height: 832 * fem,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 985 * fem,
                            height: 832.74 * fem,
                            child: Image.asset(
                              'assets/images/Woman.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(125 * fem, 142 * fem, 124 * fem, 272 * fem),
                        width: 672 * fem,
                        height: 832 * fem,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.38 * fem, 56 * fem),
                              width: 388.62 * fem,
                              height: 150 * fem,
                              child: Image.asset(
                                'assets/images/ZeenLOGO_EN 1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (_messageWidget != null) _messageWidget!,

                            Container(
                              //margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
                              padding: EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 9*fem),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      TextField(
                                        style: Theme.of(context).textTheme.bodyText1,
                                        textAlign: TextAlign.left,
                                        controller: Name,
                                        onChanged: (value) {
                                          setState(() {
                                            _isNameTextNotEmpty = value.isNotEmpty;
                                          });
                                        },
                                        keyboardType: TextInputType.name,
                                        decoration:  InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'ชื่อผู้ใช้',
                                          labelStyle: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 20*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.495*ffem/fem,
                                          ),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.orange,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_isNameTextNotEmpty)
                                        Positioned(
                                          right: 0,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.cancel,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                            onPressed: _nameclearText,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
                              padding: EdgeInsets.fromLTRB(8*fem, 0*fem, 8*fem, 9*fem),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextField(
                                    style: Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.left,
                                    controller: Password,
                                    keyboardType: TextInputType.number,
                                    obscureText: obscureText,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'รหัสผ่าน',
                                      labelStyle: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.495*ffem/fem,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.orange,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            obscureText = !obscureText;
                                          });
                                        },
                                        child: Icon(
                                          obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          size: 20*ffem,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(148*fem, 0*fem, 149*fem, 0*fem),
                              width: double.infinity,
                              height: 48*fem,
                              child: ElevatedButton(
                                onPressed: () => login(context),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  onPrimary: Colors.white,
                                  onSurface: Colors.orange,
                                ),
                                child: Center(
                                  child: Text('เข้าสู่ระบบ',
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
