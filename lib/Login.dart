import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intern_yellow_box/Domain/service_cycle.dart';
import 'package:intern_yellow_box/Domain/vault/vaultAccount.dart';
import 'package:intern_yellow_box/Menu/CycleMenu.dart';
import 'package:intern_yellow_box/component/base_screen.dart';
import 'package:intern_yellow_box/service/vault-service.dart';
import 'package:intern_yellow_box/uppercase.dart';
import 'package:intern_yellow_box/utils/local_storage_utils.dart';
import 'Menu/Manu.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_yellow_box/utils.dart';

String link =
    "https://cloudfront.image.prod.zeenapp.com/FMAD/AUDIT/20230701/FMAD_2023_07_01/A19/P003/G1/OVERALL_IMAGE_A19_P003_G1_220903.jpg?Expires=1720112400&Signature=bMgvqzCEJTI3NdJ9VQeJPPNPT8qJy32o0576ok0~dHJ2RoCfgECD4vzBKASmxQMtE7s5bjRdgpNAHTM9V~3nBrQC2NnUX5OPGZyWuBM3KPQk4y2Bm1noBgL38pugAs-hJGTwJ9q7YdgAZNdBHVRVJ4H22YNAR3LuVeI7414rMip40efdmIbyAv4jO7LtAl3so9i2RBXQ9Fti9Glvpe8dpavLbwv~W-N35LpK~yZjK5MeF5NO52DRJbgg-iFlwzWQAgd0w6BlaepZsfa6JP5aPJvpHjwihUx6MhO8X~ZFcj1r~lznhGJyAG-SYJrhX08XrTyG0eFOIrh0bi1mMwi4qw__&Key-Pair-Id=K2Z2S7OIY4WKHD";

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
  VaultAccount? account;
  var cycles;

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

  void login(BuildContext context) async {
    Name.text = 'zeen.demo01@gmail.com';
    Org.text = 'FMAD_BETA';
    Password.text = 'Zeen+54321';
    String name = Name.text.trim();
    String password = Password.text.trim();
    String org = Org.text.trim();

    if (name.isEmpty || password.isEmpty || org.isEmpty) {
      setState(() {
        _messageWidget = buildMessageWidget(
            'กรุณากรอก องค์กร หรือ ชื่อผู้ใช้ หรือ รหัสผ่าน', Colors.red);
      });
    } else {
      account = await VaultService().login(name, password, org);
      cycles = await CycleService().getCycleBlock();
      LocalStorageUtils().setVaultAccount(account!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BaseScreen(account, cycles),
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
    return Scaffold(
      body: Container(
        // loginoFP (9:64)
        padding: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // frame1Ezu (9:65)
              width: 912 * fem,
              height: 1080 * fem,
              decoration: BoxDecoration(
                color: Color(0xffe5e5e5),
              ),
              child: Align(
                // womanprotectingherselfagainstc (9:66)
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 912 * fem,
                  height: 1080 * fem,
                  child: Image.asset(
                    'assets//images/Woman.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              // frame2qjo (9:67)
              padding: EdgeInsets.fromLTRB(
                  192 * fem, 132 * fem, 200 * fem, 50 * fem),
              width: 1000 * fem,
              height: 1080 * fem,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // zeenlogoen1jaH (9:77)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 72 * fem),
                    width: 616.61 * fem,
                    height: 238 * fem,
                    child: Image.asset(
                      'assets/images/zeenlogoen-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (_messageWidget != null) _messageWidget!,
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(26 * fem, 0, 26.61 * fem, 32 * fem),
                    // padding: EdgeInsets.fromLTRB(24 * fem, 14 * fem, 24 * fem, 14 * fem),
                    width: double.infinity,
                    // Adjusted height to 64
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left,
                          controller: Org,
                          onChanged: (value) {
                            setState(() {
                              _isOrgTextNotEmpty = value.isNotEmpty;
                            });
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'องค์กร',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.495 * ffem / fem,
                            ),
                            prefixIcon: Icon(
                              Icons.account_balance_sharp,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          inputFormatters: [
                            UpperCaseTxt(),
                            // เพิ่มคลาส UpperCaseTextFormatter() ที่สร้างขึ้น
                          ],
                        ),
                        if (_isOrgTextNotEmpty)
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                                color: Colors.grey,
                              ),
                              onPressed: _OrgclearText,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    // usernameCsB (9:68)
                    margin: EdgeInsets.fromLTRB(
                        26 * fem, 0 * fem, 26.61 * fem, 32 * fem),
                    //padding: EdgeInsets.fromLTRB(24*fem, 14*fem, 24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ชื่อผู้ใช้',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.495 * ffem / fem,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
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
                  Container(
                    // passwardfEy (9:74)
                    margin: EdgeInsets.fromLTRB(
                        26 * fem, 0 * fem, 26.61 * fem, 64 * fem),
                    //padding: EdgeInsets.fromLTRB(24*fem, 14*fem, 24*fem, 14*fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left,
                          controller: Password,
                          keyboardType: TextInputType.number,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'รหัสผ่าน',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.495 * ffem / fem,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
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
                                size: 20 * ffem,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // loginJoj (9:71)
                    margin: EdgeInsets.fromLTRB(
                        224 * fem, 0 * fem, 224.61 * fem, 0 * fem),
                    width: double.infinity,
                    height: 64 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd2d2d2)),
                      color: Color(0xfffa7003),
                      borderRadius: BorderRadius.circular(8 * fem),
                    ),
                    child: ElevatedButton(
                      onPressed: () async => {login(context)},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                        onSurface: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: SafeGoogleFont(
                            'Kanit',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.495 * ffem / fem,
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
      ),
    );
  }
}
