import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intern_yellow_box/Menu/reportMenu.dart';

import '../Domain/component_report.dart';
import '../Domain/service_report.dart';
import '../utils.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
  String dropdownValue = 'FMGT_2023_01_01'; // ค่าเริ่มต้นของ Dropdown

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
    return Container(
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
                  width: double.infinity,
                  height: 36 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe5e5e5)),
                    color: Color(0xffffffff),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: SizedBox(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'FMGT_2023_01_01',
                      // เพิ่มตัวเลือก Dropdown อื่น ๆ ที่คุณต้องการ
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            value,
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
                      );
                    }).toList(),
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
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/No_Data.png',
                                        width: 251,
                                        height: 283,
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
                              if (_selectedReport == 'Audit Result') {
                                FutureBuilder(
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
                                    } else if (snapshot.hasData) {
                                      final reportData = snapshot.data;
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
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                );
                              };
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
    );
  }
}
