import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intern_yellow_box/utils.dart';

import '../Domain/component_report.dart';
import '../Domain/service_report.dart';
import '../Login.dart';
import 'CycleMenu.dart';
import 'Manu.dart';

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
  List<Report> reports = [];
  DTS dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  final _horizontalScrollController = ScrollController();
  final ReportService reportService = ReportService();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    reportf();
  }
  void reportf() async {
    final reports = await ReportService().getReport();
    dts.updateReports((reports));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                  'assets/images/zeenlogoen-1.png',
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginPage(),
                    ),
                  );
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
                          if (_selectedMenu == 'home') {
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
                          if (_selectedMenu == 'cycle') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CycleMenuPage(),
                              ),
                            );
                          }
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
                          if (_selectedMenu == 'report') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReportPage(),
                              ),
                            );
                          }
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
                    height: 910 * fem ,
                    child: Stack(
                      children: [
                        Positioned(
                          // frame12icy (1:224)
                          left: 0 * fem,
                          top: 39 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                4 * fem, 82 * fem, 0 * fem, 4 * fem),
                            width: 1452,
                            height: 821,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff717171)),
                              color: Color(0xffffffff),
                            ),
                            child: ListView(
                              children: [
                                Wrap(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // autogroupwrffaQH (Q5RqixiN3S5Uq5zz17wRff)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                      width: 1448 * fem,
                                      height: 630 * fem,
                                      child: FutureBuilder(
                                        future: reportService.getReport(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return Center(
                                              child: SpinKitDualRing(
                                                color: Colors.orange,
                                                size: 60.0,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                              child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
                                            );
                                          }
                                          else {
                                            return SingleChildScrollView(
                                              controller: _horizontalScrollController,
                                              child: PaginatedDataTable(
                                                columns: const [
                                                  DataColumn(label: Text("Cycle")),
                                                  DataColumn(label: Text("AuditID")),
                                                  DataColumn(label: Text("AuditStatus")),
                                                  DataColumn(label: Text("FoundStatus")),
                                                  DataColumn(label: Text("DcID")),
                                                  DataColumn(label: Text("DcName")),
                                                  DataColumn(label: Text("ShopID")),
                                                  DataColumn(label: Text("ShopName")),
                                                  DataColumn(label: Text("ShopSegment")),
                                                  DataColumn(label: Text("Region")),
                                                  DataColumn(label: Text("Province")),
                                                  DataColumn(label: Text("PageID")),
                                                  DataColumn(label: Text("GroupID")),
                                                  DataColumn(label: Text("QuestionID")),
                                                  DataColumn(label: Text("Topic")),
                                                  DataColumn(label: Text("Title")),
                                                  DataColumn(label: Text("Module")),
                                                  DataColumn(label: Text("Score")),
                                                  DataColumn(label: Text("OverallImageUrl")),
                                                  DataColumn(label: Text("FinalAnswer")),
                                                  DataColumn(label: Text("AutoAnswer")),
                                                  DataColumn(label: Text("AnswerBy")),
                                                  DataColumn(label: Text("AnswerDiff")),
                                                  DataColumn(label: Text("ShelfShareDiff")),
                                                  DataColumn(label: Text("PopDiff")),
                                                  DataColumn(label: Text("ClusterDiff")),
                                                  DataColumn(label: Text("ShelfLayoutDiff")),
                                                  DataColumn(label: Text("IsAISkipped")),
                                                  DataColumn(label: Text("ChallengeBy")),
                                                  DataColumn(label: Text("AutoQuestion")),
                                                  DataColumn(label: Text("DetectionStatus")),
                                                  DataColumn(label: Text("SubmitByAuditorID")),
                                                  DataColumn(label: Text("UpdateByAuditorID")),
                                                  DataColumn(label: Text("CheckInDateTime")),
                                                  DataColumn(label: Text("CheckOutDateTime")),
                                                  DataColumn(label: Text("UpdateDateTime")),
                                                  DataColumn(label: Text("QuestionTags")),
                                                  DataColumn(label: Text("ScoreTags")),
                                                  DataColumn(label: Text("QuestionRef1")),
                                                  DataColumn(label: Text("QuestionRef2")),
                                                  DataColumn(label: Text("ShopRef1")),
                                                  DataColumn(label: Text("ShopRef2")),
                                                  DataColumn(label: Text("BasketRef1")),
                                                  DataColumn(label: Text("BasketRef2")),
                                                  DataColumn(label: Text("AIAnswer")),
                                                ],
                                                source: dts,
                                                onRowsPerPageChanged: (r) {
                                                  setState(() {
                                                    _rowPerPage = r!;
                                                  });
                                                },
                                                rowsPerPage: _rowPerPage,
                                              ),
                                            );
                                          }
                                        },
                                      ),

                                    ),
                                  ],
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
                                      FutureBuilder(
                                        future: _selectedReport == 'Audit Result' ? reportService.getReport() : null, // ใช้เฉพาะเมื่อเลือก 'Audit Result'
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return Center(
                                              child: SpinKitDualRing(
                                                color: Colors.orange,
                                                size: 60.0,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                              child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
                                            );
                                          } else if (snapshot.hasData) {
                                            final reportData = snapshot.data; // ข้อมูลรายงานจาก Future

                                            return SingleChildScrollView(
                                              controller: _horizontalScrollController,
                                              child: PaginatedDataTable(
                                                columns: const [
                                                  DataColumn(label: Text("Cycle")),
                                                  DataColumn(label: Text("AuditID")),
                                                  DataColumn(label: Text("AuditStatus")),
                                                  DataColumn(label: Text("FoundStatus")),
                                                  DataColumn(label: Text("DcID")),
                                                  DataColumn(label: Text("DcName")),
                                                  DataColumn(label: Text("ShopID")),
                                                  DataColumn(label: Text("ShopName")),
                                                  DataColumn(label: Text("ShopSegment")),
                                                  DataColumn(label: Text("Region")),
                                                  DataColumn(label: Text("Province")),
                                                  DataColumn(label: Text("PageID")),
                                                  DataColumn(label: Text("GroupID")),
                                                  DataColumn(label: Text("QuestionID")),
                                                  DataColumn(label: Text("Topic")),
                                                  DataColumn(label: Text("Title")),
                                                  DataColumn(label: Text("Module")),
                                                  DataColumn(label: Text("Score")),
                                                  DataColumn(label: Text("OverallImageUrl")),
                                                  DataColumn(label: Text("FinalAnswer")),
                                                  DataColumn(label: Text("AutoAnswer")),
                                                  DataColumn(label: Text("AnswerBy")),
                                                  DataColumn(label: Text("AnswerDiff")),
                                                  DataColumn(label: Text("ShelfShareDiff")),
                                                  DataColumn(label: Text("PopDiff")),
                                                  DataColumn(label: Text("ClusterDiff")),
                                                  DataColumn(label: Text("ShelfLayoutDiff")),
                                                  DataColumn(label: Text("IsAISkipped")),
                                                  DataColumn(label: Text("ChallengeBy")),
                                                  DataColumn(label: Text("AutoQuestion")),
                                                  DataColumn(label: Text("DetectionStatus")),
                                                  DataColumn(label: Text("SubmitByAuditorID")),
                                                  DataColumn(label: Text("UpdateByAuditorID")),
                                                  DataColumn(label: Text("CheckInDateTime")),
                                                  DataColumn(label: Text("CheckOutDateTime")),
                                                  DataColumn(label: Text("UpdateDateTime")),
                                                  DataColumn(label: Text("QuestionTags")),
                                                  DataColumn(label: Text("ScoreTags")),
                                                  DataColumn(label: Text("QuestionRef1")),
                                                  DataColumn(label: Text("QuestionRef2")),
                                                  DataColumn(label: Text("ShopRef1")),
                                                  DataColumn(label: Text("ShopRef2")),
                                                  DataColumn(label: Text("BasketRef1")),
                                                  DataColumn(label: Text("BasketRef2")),
                                                  DataColumn(label: Text("AIAnswer")),
                                                ],
                                                source: dts, // ใช้ข้อมูลรายงานเป็นแหล่งข้อมูลในตาราง
                                                onRowsPerPageChanged: (r) {
                                                  setState(() {
                                                    _rowPerPage = r!;
                                                  });
                                                },
                                                rowsPerPage: _rowPerPage,
                                              ),
                                            );
                                          } else {
                                            return SizedBox(); // สถานะที่ไม่มีข้อมูล (อาจเกิดขึ้นได้หากยังไม่มีการคลิกปุ่ม 'Audit Result')
                                          }
                                        },
                                      );
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
                                          color: _selectedReport ==
                                              'Audit Result'
                                              ? selectedTextColor
                                              : defaultTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      8 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
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
                                              color: _selectedReport ==
                                                  'Audit Overview'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport ==
                                                'Audit Overview'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                                color: _selectedReport ==
                                                    'Audit Overview'
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
                                              color: _selectedReport ==
                                                  'Basket Overview'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport ==
                                                'Basket Overview'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                                color: _selectedReport ==
                                                    'Basket Overview'
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
                                              color: _selectedReport ==
                                                  'Shop Compliance'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport ==
                                                'Shop Compliance'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                                color: _selectedReport ==
                                                    'Shop Compliance'
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
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                              color: _selectedReport ==
                                                  'Share Of Shelf'
                                                  ? selectedBorderColor
                                                  : defaultBorderColor,
                                            ),
                                            color: _selectedReport ==
                                                'Share Of Shelf'
                                                ? selectedBackgroundColor
                                                : defaultBackgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5 * fem),
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                                color: _selectedReport ==
                                                    'Share Of Shelf'
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
                                              topRight: Radius.circular(
                                                  5 * fem),
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
                                                color: _selectedReport ==
                                                    'Score'
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
class DTS extends DataTableSource {
  List<Report> reports = [];

  void updateReports(List<Report> newReports) {
    reports.clear();
    reports.addAll(newReports);
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    // ตรวจสอบว่ามีข้อมูลในรายการ reports หรือไม่
    // if (index >= reports.length) return null;
    final Report = reports[index];
    return DataRow(
      cells:  [
        DataCell(Text(Report.Cycle?? '')),
        DataCell(Text(Report.AuditID?? '')),
        DataCell(Text(Report.AuditStatus?? '')),
        DataCell(Text(Report.FoundStatus?? '')),
        DataCell(Text(Report.DcID?? '')),
        DataCell(Text(Report.DcName?? '')),
        DataCell(Text(Report.ShopID?? '')),
        DataCell(Text(Report.ShopName?? '')),
        DataCell(Text(Report.ShopSegment?? '')),
        DataCell(Text(Report.Region?? '')),
        DataCell(Text(Report.Province?? '')),
        DataCell(Text(Report.PageID?? '')),
        DataCell(Text(Report.GroupID?? '')),
        DataCell(Text(Report.QuestionID?? '')),
        DataCell(Text(Report.Topic?? '')),
        DataCell(Text(Report.Title?? '')),
        DataCell(Text(Report.Module?? '')),
        DataCell(Text(Report.Score != null ? Report.Score.toString() : '')),
        DataCell(Text(Report.OverallImageUrl?? '')),
        DataCell(Text(Report.FinalAnswer?? '')),
        DataCell(Text(Report.AutoAnswer?? '')),
        DataCell(Text(Report.AnswerBy?? '')),
        DataCell(Text(Report.AnswerDiff?? '')),
        DataCell(Text(Report.ShelfShareDiff?? '')),
        DataCell(Text(Report.PopDiff?? '')),
        DataCell(Text(Report.ClusterDiff?? '')),
        DataCell(Text(Report.ShelfLayoutDiff?? '')),
        DataCell(Text(Report.IsAISkipped?? '')),
        DataCell(Text(Report.ChallengeBy?? '')),
        DataCell(Text(Report.AutoQuestion?? '')),
        DataCell(Text(Report.DetectionStatus?? '')),
        DataCell(Text(Report.SubmitByAuditorID?? '')),
        DataCell(Text(Report.UpdateByAuditorID?? '')),
        DataCell(Text(Report.CheckInDateTime?? '')),
        DataCell(Text(Report.CheckOutDateTime?? '')),
        DataCell(Text(Report.UpdateDateTime?? '')),
        DataCell(Text(Report.QuestionTags?? '')),
        DataCell(Text(Report.ScoreTags?? '')),
        DataCell(Text(Report.QuestionRef1?? '')),
        DataCell(Text(Report.QuestionRef2?? '')),
        DataCell(Text(Report.ShopRef1?? '')),
        DataCell(Text(Report.ShopRef2?? '')),
        DataCell(Text(Report.BasketRef1?? '')),
        DataCell(Text(Report.BasketRef2?? '')),
        DataCell(Text(Report.AIAnswer?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => reports.length;

  @override
  int get selectedRowCount => 0;
}
