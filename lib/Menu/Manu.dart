import 'package:flutter/material.dart';
import 'package:intern_yellow_box/utils.dart';
import 'package:flutter/src/services/asset_manifest.dart';
import 'package:google_fonts/src/asset_manifest.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedMenu = 'home'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / 1920;
    final double ffem = fem * 0.97;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1920, 68),
        child: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Image.asset(
                  'assets/images/ZeenLOGO_EN 1.png',
                  width: 124.36,
                  height: 48,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  width: 304,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 44, 12),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
                          // ...
                        },
                        icon: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xff323131),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: InkWell(
                onTap: () {
                  // ตรวจสอบการ Logout และดำเนินการตามต้องการ
                  // ...
                },
                child: Container(
                  width: 102,
                  height: 44,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff717171),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(0xff717171),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xff717171),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Row(
          children: [
            SingleChildScrollView(
              child: Container(
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffffffff)),
                        color: Color(0xff323131),
                      ),
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
                                  'Auditor01',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.495 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'ORG: PLUS',
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
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.fromLTRB(9 * fem, 9 * fem, 0 * fem, 9 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff717171)),
                          color: _selectedMenu == 'home'
                              ? Colors.orange
                              : Color(0xff323131),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
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
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            14 * fem, 9 * fem, 121 * fem, 9 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff717171)),
                          color: _selectedMenu == 'cycle'
                              ? Colors.orange
                              : Color(0xff323131),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
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
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            14 * fem, 9 * fem, 109 * fem, 9 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff717171)),
                          color: _selectedMenu == 'report'
                              ? Colors.orange
                              : Color(0xff323131),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
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
                          fit: BoxFit.scaleDown,
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
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 740 * fem),
                  width: 220 * fem,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add your content here
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
