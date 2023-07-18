import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intern_yellow_box/component/cycle_screen.dart';
import 'package:intern_yellow_box/component/cycle_screen2.dart';
import 'package:intern_yellow_box/component/header.dart';
import 'package:intern_yellow_box/component/logout.dart';
import 'package:intern_yellow_box/component/report_screen.dart';

import '../Domain/component_cycle.dart';
import '../Domain/service_cycle.dart';
import '../Domain/vault/vaultAccount.dart';
import '../Login.dart';
import '../Menu/Manu.dart';
import '../Menu/reportMenu.dart';
import '../utils.dart';

class BaseScreen extends StatefulWidget {
  final VaultAccount? account;
  final List<CycleBlock> cycles;

  const BaseScreen(this.account, this.cycles);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  String _selectedMenu = 'cycle'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1920, 68),
        child: AppBar(
          title: ZeenHeader(),
          backgroundColor: Color(0xff323131),
          actions: [
            LogoutButton(),
          ],
        ),
      ),
      body: Container(
        child: Row(
          children: [
            SingleChildScrollView(
              child: hamburgerBar(),
            ),
            if (_selectedMenu == 'cycle') ...[
              // CycleScreen(),
              CycleScreen2(widget.cycles),
            ] else if (_selectedMenu == 'report') ...[
              ReportScreen(),
            ],
          ],
        ),
      ),
    );
  }

  Widget hamburgerBar() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / 1920;
    final double ffem = fem * 0.97;
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 740 * fem),
      width: 220 * fem,
      decoration: BoxDecoration(
        color: Color(0xff323131),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 227 * fem,
            height: 80 * fem,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Color(0xffffffff)),
            //   color: Color(0xff323131),
            // ),
            child: Stack(
              children: [
                Positioned(
                  left: 16 * fem,
                  top: 12 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 56 * fem,
                      height: 56 * fem,
                      child: Image.asset(
                        'assets/images/mask-group.png',
                        width: 56 * fem,
                        height: 56 * fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 88 * fem,
                  top: 18 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.account!.user!,
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.495 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                      Text(
                        'ORG: ${widget.account!.org!}',
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.495 * ffem / fem,
                          color: Color(0xfffa7003),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9 * fem),
          InkWell(
            onTap: () {
              setState(() {
                _selectedMenu = 'home';
                if (_selectedMenu == 'dashboard') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(),
                    ),
                  );
                }
              });
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(9 * fem, 9 * fem, 0 * fem, 9 * fem),
              width: double.infinity,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Color(0xff717171)),
              //   color: _selectedMenu == 'home'
              //       ? Colors.orange
              //       : Color(0xff323131),
              // ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 16 * fem, 0 * fem),
                      width: 18 * fem,
                      height: 22 * fem,
                      child: Image.asset(
                        'assets/images/homeicon.png',
                        width: 18 * fem,
                        height: 22 * fem,
                      ),
                    ),
                    SizedBox(height: 9 * fem),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 106 * fem, 0 * fem),
                      child: Text(
                        'Home',
                        style: SafeGoogleFont(
                          'Kanit',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.495 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 9 * fem),
          InkWell(
            onTap: () {
              setState(() {
                _selectedMenu = 'cycle';
                // if (_selectedMenu == 'cycle') {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CycleMenuPage(),
                //     ),
                //   );
                // }
              });
            },
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(14 * fem, 9 * fem, 121 * fem, 9 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff717171)),
                color: _selectedMenu == 'cycle'
                    ? Colors.orange
                    : Color(0xff323131),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 16 * fem, 0 * fem),
                      width: 16 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/images/cycleicon.png',
                        width: 16 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    Text(
                      'Cycle',
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 9 * fem),
          InkWell(
            onTap: () {
              setState(() {
                _selectedMenu = 'report';
                if (_selectedMenu == 'report') {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ReportPage(),
                  //   ),
                  // );
                }
              });
            },
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(14 * fem, 9 * fem, 109 * fem, 9 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff717171)),
                color: _selectedMenu == 'report'
                    ? Colors.orange
                    : Color(0xff323131),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 16 * fem, 0 * fem),
                      width: 16 * fem,
                      height: 20 * fem,
                      child: Image.asset(
                        'assets/images/reporticon.png',
                        width: 16 * fem,
                        height: 20 * fem,
                      ),
                    ),
                    Text(
                      'Report',
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 9 * fem),
          InkWell(
            onTap: () {
              setState(() {
                _selectedMenu = 'dashboard';
                if (_selectedMenu == 'dashboard') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenuPage(),
                    ),
                  );
                }
              });
            },
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(14 * fem, 9 * fem, 80 * fem, 9 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff717171)),
                color: _selectedMenu == 'dashboard'
                    ? Colors.orange
                    : Color(0xff323131),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 22 * fem, 0 * fem),
                      width: 22 * fem,
                      height: 22 * fem,
                      child: Image.asset(
                        'assets/images/dashboardicon.png',
                        width: 22 * fem,
                        height: 22 * fem,
                      ),
                    ),
                    Text(
                      'Dashboard',
                      style: SafeGoogleFont(
                        'Kanit',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.495 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
