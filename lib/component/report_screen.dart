import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import '../Domain/component_cycle.dart';
import '../Domain/component_report.dart';
import '../Domain/service_cycle.dart';
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
  late DTS dts;
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  final _horizontalScrollController = ScrollController();
  final ReportService reportService = ReportService();
  String searchFilter = '';
  late Future<List<CycleBlock>> futureCycle;
  final CycleService cycleService = CycleService();
  String listValue = '';

  String? dropdownValue;
  List<String> dropdownOptions = [
    'Option 1',
    'Option 2',
    'Option 3',
    // เพิ่มรายการข้อมูลตามที่คุณต้องการ
  ];

  @override
  void initState() {
    super.initState();
    futureCycle = cycleService.getCycleBlock();
    dts = DTS(context: context);
    reportf();
  }

  void reportf() async {
    final reports = await ReportService().getReport();
    dts.updateReports((reports));
  }

//
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / 1920;
    final double ffem = fem * 0.97;
    return Container(
      // autogroupfx1bF4d (Q5RuU29MZHLT2yQDo5fX1B)
      padding: EdgeInsets.fromLTRB(8 * fem, 16 * fem, 0 * fem, 20 * fem),
      height: double.infinity,
      child: Container(
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroupusdpNf3 (Q5RpQAazQLr5nSTAqSuSdP)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
              width: 216 * fem,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        //margin: EdgeInsets.fromLTRB(100 * fem, 20 * fem, 0 * fem, 1 * fem),
                        height: 30 * fem,
                        child: ElevatedButton(
                          onPressed: () {
                            downloadAndSaveCSV();
                          },
                          child: Text('Download CSV'),
                        ),
                      ),
                    ],
                  ),
                  Container(
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 12 * fem),
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
                              style: TextStyle(
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
                          height: 696 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffe5e5e5)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'ค้นหา Cycle',
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      searchFilter = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: FutureBuilder<List<CycleBlock>>(
                                  future: futureCycle,
                                  builder: (context, cycles) {
                                    if (cycles.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.orange,
                                        ),
                                      );
                                    } else if (cycles.hasData) {
                                      //List<CycleBlock> cycleBlockWithFilter = cycles.data!;
                                      var cycleBlockWithFilter = cycles.data;

                                      cycleBlockWithFilter =
                                          cycleBlockWithFilter!.where((cycle) {
                                        if (cycle.cycle != null) {
                                          return cycle.cycle!
                                              .toUpperCase()
                                              .contains(searchFilter
                                                  .toUpperCase()
                                                  .trim());
                                        }
                                        return false;
                                      }).toList();
                                      return ListView.builder(
                                        itemCount: cycleBlockWithFilter.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          CycleBlock cycleBlock =
                                              cycleBlockWithFilter![index];
                                          String value = cycleBlock.cycle!;

                                          bool isSelected = value == listValue;

                                          return Container(
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Color.fromRGBO(
                                                      255, 230, 187, 1.0)
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 12 * fem),
                                              child: ListTile(
                                                title: Text(
                                                  value,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.495,
                                                    color: isSelected
                                                        ? Colors.black
                                                        : Color(0xff717171),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    listValue = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else if (cycles.hasError) {
                                      return Text('Error: ${cycles.error}');
                                    } else {
                                      return Text('No data available');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupx7eyQ6V (Q5RqaYniP5wXuPXXmAX7ey)
              margin: EdgeInsets.fromLTRB(0 * fem, 66 * fem, 0 * fem, 0 * fem),
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
                          4 * fem, 5 * fem, 0 * fem, 4 * fem),
                      width: 1452,
                      height: 800,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff717171)),
                        color: Color(0xffffffff),
                      ),
                      child: ListView(
                        children: [
                          Wrap(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    10 * fem, 20 * fem, 0 * fem, 0 * fem),
                                width: 1448 * fem,
                                height: 1150 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 14 * fem),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //SizedBox(width: 10), // เพิ่มส่วนนี้เพื่อเว้นระยะห่างระหว่างปุ่ม Filter และปุ่ม Search
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: 104,
                                                height: 46,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  value: dropdownValue,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValue = newValue;
                                                    });
                                                  },
                                                  items: dropdownOptions
                                                      .map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  decoration: InputDecoration(
                                                    labelText: 'Dropdown',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 24,
                                              ),
                                              Container(
                                                width: 349,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: TextField(
                                                  controller: searchController,
                                                  decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            12, 12, 44, 12),
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: reportService.getReport(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: SpinKitDualRing(
                                              color: Colors.orange,
                                              size: 60.0,
                                            ),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Center(
                                            child: Text(
                                                'เกิดข้อผิดพลาด: ${snapshot.error}'),
                                          );
                                        } else if (snapshot.hasData) {
                                          final reportData = snapshot.data;
                                          return SingleChildScrollView(
                                            controller:
                                                _horizontalScrollController,
                                            child: PaginatedDataTable(
                                              columns: const [
                                                DataColumn(
                                                    label: Text("Cycle")),
                                                DataColumn(
                                                    label: Text("AuditID")),
                                                DataColumn(
                                                    label: Text("AuditStatus")),
                                                DataColumn(
                                                    label: Text("FoundStatus")),
                                                DataColumn(label: Text("DcID")),
                                                DataColumn(
                                                    label: Text("DcName")),
                                                DataColumn(
                                                    label: Text("ShopID")),
                                                DataColumn(
                                                    label: Text("ShopName")),
                                                DataColumn(
                                                    label: Text("ShopSegment")),
                                                DataColumn(
                                                    label: Text("Region")),
                                                DataColumn(
                                                    label: Text("Province")),
                                                DataColumn(
                                                    label: Text("PageID")),
                                                DataColumn(
                                                    label: Text("GroupID")),
                                                DataColumn(
                                                    label: Text("QuestionID")),
                                                DataColumn(
                                                    label: Text("Topic")),
                                                DataColumn(
                                                    label: Text("Title")),
                                                DataColumn(
                                                    label: Text("Module")),
                                                DataColumn(
                                                    label: Text("Score")),
                                                //DataColumn(label: Text("OverallImageUrl")),
                                                DataColumn(
                                                    label: Text("FinalAnswer")),
                                                DataColumn(
                                                    label: Text("AutoAnswer")),
                                                DataColumn(
                                                    label: Text("AnswerBy")),
                                                DataColumn(
                                                    label: Text("AnswerDiff")),
                                                DataColumn(
                                                    label:
                                                        Text("ShelfShareDiff")),
                                                DataColumn(
                                                    label: Text("PopDiff")),
                                                DataColumn(
                                                    label: Text("ClusterDiff")),
                                                DataColumn(
                                                    label: Text(
                                                        "ShelfLayoutDiff")),
                                                DataColumn(
                                                    label: Text("IsAISkipped")),
                                                DataColumn(
                                                    label: Text("ChallengeBy")),
                                                DataColumn(
                                                    label:
                                                        Text("AutoQuestion")),
                                                DataColumn(
                                                    label: Text(
                                                        "DetectionStatus")),
                                                DataColumn(
                                                    label: Text(
                                                        "SubmitByAuditorID")),
                                                DataColumn(
                                                    label: Text(
                                                        "UpdateByAuditorID")),
                                                DataColumn(
                                                    label: Text(
                                                        "CheckInDateTime")),
                                                DataColumn(
                                                    label: Text(
                                                        "CheckOutDateTime")),
                                                DataColumn(
                                                    label:
                                                        Text("UpdateDateTime")),
                                                DataColumn(
                                                    label:
                                                        Text("QuestionTags")),
                                                DataColumn(
                                                    label: Text("ScoreTags")),
                                                DataColumn(
                                                    label:
                                                        Text("QuestionRef1")),
                                                DataColumn(
                                                    label:
                                                        Text("QuestionRef2")),
                                                DataColumn(
                                                    label: Text("ShopRef1")),
                                                DataColumn(
                                                    label: Text("ShopRef2")),
                                                DataColumn(
                                                    label: Text("BasketRef1")),
                                                DataColumn(
                                                    label: Text("BasketRef2")),
                                                DataColumn(
                                                    label: Text("AIAnswer")),
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
                            padding: EdgeInsets.fromLTRB(
                                8 * fem, 0 * fem, 0 * fem, 0 * fem),
                            height: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedReport = 'Audit Overview';
                                      FutureBuilder(
                                        future: reportService.getReport(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                              child: SpinKitDualRing(
                                                color: Colors.orange,
                                                size: 60.0,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Center(
                                              child: Text(
                                                  'เกิดข้อผิดพลาด: ${snapshot.error}'),
                                            );
                                          } else {
                                            return Center(
                                              child: Image.asset(
                                                'assets/images/zeenlogoen-1.png',
                                                width: 251,
                                                height: 283,
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 144 * fem,
                                    height: 39 * fem,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            _selectedReport == 'Audit Overview'
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
                                        color:
                                            _selectedReport == 'Basket Overview'
                                                ? selectedBorderColor
                                                : defaultBorderColor,
                                      ),
                                      color:
                                          _selectedReport == 'Basket Overview'
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
                                        color:
                                            _selectedReport == 'Shop Compliance'
                                                ? selectedBorderColor
                                                : defaultBorderColor,
                                      ),
                                      color:
                                          _selectedReport == 'Shop Compliance'
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
                                        color:
                                            _selectedReport == 'Share Of Shelf'
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
    );
  }
}

class DTS extends DataTableSource {
  BuildContext context;
  DTS({required this.context});
  List<Report> reports = [];

  void updateReports(List<Report> newReports) {
    reports.clear();
    reports.addAll(newReports);
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    // ตรวจสอบว่ามีข้อมูลในรายการ reports หรือไม่
    // if (index >= reports.length) return null;
    final Report = reports[index];

    return DataRow(
      cells: [
        DataCell(
          InkWell(
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('OverallImage'),
                    content: Container(
                      width: 500,
                      height: 500,
                      child: Image.network(
                        'https://cloudfront.image.prod.zeenapp.com/FMAD/AUDIT/20230701/FMAD_2023_07_01/A19/P003/G1/OVERALL_IMAGE_A19_P003_G1_220903.jpg?Expires=1720112400&Signature=bMgvqzCEJTI3NdJ9VQeJPPNPT8qJy32o0576ok0~dHJ2RoCfgECD4vzBKASmxQMtE7s5bjRdgpNAHTM9V~3nBrQC2NnUX5OPGZyWuBM3KPQk4y2Bm1noBgL38pugAs-hJGTwJ9q7YdgAZNdBHVRVJ4H22YNAR3LuVeI7414rMip40efdmIbyAv4jO7LtAl3so9i2RBXQ9Fti9Glvpe8dpavLbwv~W-N35LpK~yZjK5MeF5NO52DRJbgg-iFlwzWQAgd0w6BlaepZsfa6JP5aPJvpHjwihUx6MhO8X~ZFcj1r~lznhGJyAG-SYJrhX08XrTyG0eFOIrh0bi1mMwi4qw__&Key-Pair-Id=K2Z2S7OIY4WKHD', // ใส่ URL ของรูปภาพที่ต้องการแสดงใน pop-up
                        fit: BoxFit.contain,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('CLOSE'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              children: [
                Icon(Icons.image), // ไอคอนรูปภาพ
                SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                Text(Report.Cycle ?? ''), // ข้อความของ Cycle
              ],
            ),
          ),
        ),

        DataCell(Text(Report.AuditID ?? '')),
        DataCell(Text(Report.AuditStatus ?? '')),
        DataCell(Text(Report.FoundStatus ?? '')),
        DataCell(Text(Report.DcID ?? '')),
        DataCell(Text(Report.DcName ?? '')),
        DataCell(Text(Report.ShopID ?? '')),
        DataCell(Text(Report.ShopName ?? '')),
        DataCell(Text(Report.ShopSegment ?? '')),
        DataCell(Text(Report.Region ?? '')),
        DataCell(Text(Report.Province ?? '')),
        DataCell(Text(Report.PageID ?? '')),
        DataCell(Text(Report.GroupID ?? '')),
        DataCell(Text(Report.QuestionID ?? '')),
        DataCell(Text(Report.Topic ?? '')),
        DataCell(Text(Report.Title ?? '')),
        DataCell(Text(Report.Module ?? '')),
        DataCell(Text(Report.Score != null ? Report.Score.toString() : '')),
        //DataCell(Text(Report.OverallImageUrl?? '')),
        DataCell(Text(Report.FinalAnswer ?? '')),
        DataCell(Text(Report.AutoAnswer ?? '')),
        DataCell(Text(Report.AnswerBy ?? '')),
        DataCell(Text(Report.AnswerDiff ?? '')),
        DataCell(Text(Report.ShelfShareDiff ?? '')),
        DataCell(Text(Report.PopDiff ?? '')),
        DataCell(Text(Report.ClusterDiff ?? '')),
        DataCell(Text(Report.ShelfLayoutDiff ?? '')),
        DataCell(Text(Report.IsAISkipped ?? '')),
        DataCell(Text(Report.ChallengeBy ?? '')),
        DataCell(Text(Report.AutoQuestion ?? '')),
        DataCell(Text(Report.DetectionStatus ?? '')),
        DataCell(Text(Report.SubmitByAuditorID ?? '')),
        DataCell(Text(Report.UpdateByAuditorID ?? '')),
        DataCell(Text(Report.CheckInDateTime ?? '')),
        DataCell(Text(Report.CheckOutDateTime ?? '')),
        DataCell(Text(Report.UpdateDateTime ?? '')),
        DataCell(Text(Report.QuestionTags ?? '')),
        DataCell(Text(Report.ScoreTags ?? '')),
        DataCell(Text(Report.QuestionRef1 ?? '')),
        DataCell(Text(Report.QuestionRef2 ?? '')),
        DataCell(Text(Report.ShopRef1 ?? '')),
        DataCell(Text(Report.ShopRef2 ?? '')),
        DataCell(Text(Report.BasketRef1 ?? '')),
        DataCell(Text(Report.BasketRef2 ?? '')),
        DataCell(Text(Report.AIAnswer ?? '')),
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

// void downloadCSV() async {
//   try {
//     const url =
//         'http://192.168.86.80:8083/training-ws/report/downloadCSVByCriteria?org=ZEENDEMO2_BETA&cycle=ZEENDEMO2_BETA_2023_07_14n'; // URL ของ API ที่ส่งคำขอดาวน์โหลดไฟล์ CSV
//     final response = await http.post(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final bytes = response.bodyBytes;
//       // กำหนดตำแหน่งที่เก็บไฟล์ CSV
//       final filePath = 'path/to/save/file.csv';
//       // บันทึกไฟล์ลงในระบบของแอปพลิเคชัน
//       await File(filePath).writeAsBytes(bytes);
//       print('ไฟล์ CSV ดาวน์โหลดเรียบร้อยแล้ว');
//     } else {
//       print('เกิดข้อผิดพลาดในการดาวน์โหลดไฟล์ CSV');
//     }
//   } catch (error) {
//     print('เกิดข้อผิดพลาดในการดาวน์โหลดไฟล์ CSV: $error');
//   }
// }

void downloadAndSaveCSV() async {
  try {
    const url =
        'http://192.168.86.80:8083/training-ws/report/downloadCSVByCriteria?org=ZEENDEMO2_BETA&cycle=ZEENDEMO2_BETA_2023_07_14n'; // URL ของ API ที่ส่งคำขอดาวน์โหลดไฟล์ CSV

    final response = await http.post(
      Uri.parse(url),
      body: {}, // กำหนด body ตามที่ API ระบุ (เป็น Map หรือ Object)
    );

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final filePath =
          'path/to/save/file.csv'; // กำหนดตำแหน่งที่เก็บไฟล์ CSV ที่คุณต้องการ

      await File(filePath).writeAsBytes(bytes);
      print('ไฟล์ CSV บันทึกเรียบร้อยแล้ว: $filePath');
    } else {
      print('เกิดข้อผิดพลาดในการดาวน์โหลดไฟล์ CSV');
    }
  } catch (error) {
    print('เกิดข้อผิดพลาดในการดาวน์โหลดและจัดเก็บไฟล์ CSV: $error');
  }
}
