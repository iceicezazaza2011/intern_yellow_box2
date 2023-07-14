import 'package:flutter/material.dart';
import 'package:intern_yellow_box/utils.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedMenu = 'report'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
 // String _selectedReport = 'Audit Result'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  Color defaultBackgroundColor = Color(0xfffca316);
  Color defaultTextColor = Color(0xffffffff);
  Color defaultBorderColor = Color(0xfffca316);
  Color selectedBackgroundColor = Colors.white;
  Color selectedTextColor = Colors.black;
  Color selectedBorderColor = Colors.black;
  String _selectedReport = '';

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
                        padding: EdgeInsets.fromLTRB(
                            9 * fem, 9 * fem, 0 * fem, 9 * fem),
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
                        padding: EdgeInsets.fromLTRB(
                            14 * fem, 9 * fem, 80 * fem, 9 * fem),
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
            Container(
              // autogroupfx1bF4d (Q5RuU29MZHLT2yQDo5fX1B)
              padding:
                  EdgeInsets.fromLTRB(8 * fem, 16 * fem, 0 * fem, 20 * fem),
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupusdpNf3 (Q5RpQAazQLr5nSTAqSuSdP)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
                    width: 216 * fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // reportuQ5 (1:143)
                          margin: EdgeInsets.fromLTRB(
                              16 * fem, 0 * fem, 0 * fem, 16 * fem),
                          child: Text(
                            'REPORT',
                            style: SafeGoogleFont(
                              'Kanit',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.495 * ffem / fem,
                              color: Color(0xff323131),
                            ),
                          ),
                        ),
                        Container(
                          // cycleEBT (1:144)
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 12 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group46VdB (1:217)
                                width: double.infinity,
                                height: 40 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xfffca316),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5 * fem),
                                    topRight: Radius.circular(5 * fem),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cycle',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 24 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.495 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 32 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe5e5e5)),
                                  color: Color(0xffffffff),
                                ),
                                child: TextField(
                                  controller: searchController,
                                  //textAlignVertical: TextAlignVertical.center, // แสดงข้อความตรงกลางแนวตั้ง
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(left: 44),
                                    // ย้ายแถบไปทางด้านซ้าย
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
                                        // ...
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // c1dmK (1:212)
                                width: double.infinity,
                                height: 36 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe5e5e5)),
                                  color: Color(0xffffe5bb),
                                ),
                                child: Center(
                                  child: Text(
                                    'FMGT_2023_01_01',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.495 * ffem / fem,
                                      color: Color(0xff323131),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // c38CH (1:209)
                                width: double.infinity,
                                height: 36 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe5e5e5)),
                                  color: Color(0xffffffff),
                                ),
                                child: Center(
                                  child: Text(
                                    'FMGT_2023_01_01',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.495 * ffem / fem,
                                      color: Color(0xff717171),
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
                  Container(
                    // autogroupx7eyQ6V (Q5RqaYniP5wXuPXXmAX7ey)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 66 * fem, 0 * fem, 0 * fem),
                    width: 1452 * fem,
                    height: 910 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // frame12icy (1:224)
                          left: 0 * fem,
                          top: 39 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                4 * fem, 82 * fem, 0 * fem, 4 * fem),
                            width: 1452 * fem,
                            height: 871 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff717171)),
                              color: Color(0xffffffff),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupwrffaQH (Q5RqixiN3S5Uq5zz17wRff)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 315 * fem),
                                  width: 1660 * fem,
                                  height: 460 * fem,
                                  child: Stack(
                                    children: [
                                      ///// ใส่ข้อมูล Datatable /////
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogrouphfnyQfK (Q5RsHan2nhSCNGTxR7hfNy)
                                  margin: EdgeInsets.fromLTRB(
                                      10.99 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 401.01 * fem,
                                  height: 10 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle88LYy (1:225)
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 399.76 * fem,
                                            height: 10 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10 * fem),
                                                color: Color(0xffd9d9d9),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // rectangle92FA9 (1:533)
                                        left: 1.009765625 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 400 * fem,
                                            height: 10 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5 * fem),
                                                color: Color(0xffd9d9d9),
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
                        ),
                        Positioned(
                          // group52YQ9 (1:534)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Container(
                            width: 1232 * fem,
                            height: 40 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedReport = 'Audit Result';
                                    });
                                  },
                                  child: Container(
                                    width: 144 * fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _selectedReport == 'Audit Result'
                                            ? selectedBorderColor
                                            : defaultBorderColor,
                                      ),
                                      color: _selectedReport == 'Audit Result'
                                          ? selectedBackgroundColor
                                          : defaultBackgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5 * fem),
                                        topRight: Radius.circular(5 * fem),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Audit Result',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Kanit',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.495 * ffem / fem,
                                          color: _selectedReport == 'Audit Result'
                                              ? selectedTextColor
                                              : defaultTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(8 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'Audit Overview';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'Audit Overview'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'Audit Overview'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Audit Overview',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'Audit Overview'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8 * fem),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'Basket Overview';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'Basket Overview'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'Basket Overview'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Basket Overview',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'Basket Overview'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8 * fem),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'Shop Compliance';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'Shop Compliance'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'Shop Compliance'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Shop Compliance',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'Shop Compliance'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'OOS';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'OOS'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'OOS'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'OOS',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'OOS'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'OSA';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'OSA'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'OSA'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'OSA',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'OSA'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'Share Of Shelf';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'Share Of Shelf'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'Share Of Shelf'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Share Of Shelf',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'Share Of Shelf'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * fem,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedReport = 'Score';
                                          });
                                        },
                                        child: Container(
                                          width: 144 * fem,
                                          height: 39 * fem,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _selectedReport == 'Score'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport == 'Score'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(5 * fem),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Score',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                height: 1.495 * ffem / fem,
                                                color: _selectedReport == 'Score'
                                                    ? selectedTextColor
                                                    : defaultTextColor,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), //
    );
  }
}
