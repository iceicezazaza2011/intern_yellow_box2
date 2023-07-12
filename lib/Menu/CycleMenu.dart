import 'package:flutter/material.dart';
import 'package:intern_yellow_box/utils.dart';
import 'dart:convert';
import '../Domain/component_cycle.dart';
import '../Domain/service_cycle.dart';

class CycleMenuPage extends StatefulWidget {
  //const CycleMenuPage({required Key key}) : super(key: key);

  @override
  State<CycleMenuPage> createState() => _CycleMenuPageState();
}

class _CycleMenuPageState extends State<CycleMenuPage> {
  List<CycleBlock> CycleBlocks = [];
  final List<int> availableRowsPerPage = [2, 5, 10, 20, 50];
  TextEditingController _searchController = TextEditingController();
  String _selectedMenu = 'home'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
  DTS dts = DTS([]);
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  final CycleService cycleService = CycleService(); // ฟิวเจอร์บิวเดอร์

  @override
  void initState() {
    super.initState();
    cyclef();
  }

  void cyclef() async {
    final CycleBlocks = await CycleService().getCycleBlock();
    dts.updateCycleBlocks((CycleBlocks));
  }

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
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            'OVERVIEW',
                            style: SafeGoogleFont(
                              'Kanit',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.bold,
                              height: 1.495 * ffem / fem,
                              color: Color(0xff717171),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Container(
                              width: 312 * fem,
                              height: 136 * fem,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 2 * fem,
                                            ),
                                            child: Text(
                                              "ALL CYCLE",
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.495 * ffem / fem,
                                                color: Color.fromRGBO(
                                                    93, 176, 243, 1),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/CYCLE.png',
                                        width: 88 * ffem,
                                        height: 88 * ffem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 136 * fem,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 2 * fem,
                                            ),
                                            child: Text(
                                              "IN PROGRESS",
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.495 * ffem / fem,
                                                color: Color(0xfffa7003),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/inprogress.png',
                                        width: 88 * ffem,
                                        height: 88 * ffem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 136 * fem,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 2 * fem,
                                            ),
                                            child: Text(
                                              "NEW CYCLE",
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.495 * ffem / fem,
                                                color: Color(0xffffbe52),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/new.png',
                                        width: 88 * ffem,
                                        height: 88 * ffem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 136 * fem,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 2 * fem,
                                            ),
                                            child: Text(
                                              "DONE",
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.495 * ffem / fem,
                                                color: Color(0xff00c981),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/done.png',
                                        width: 88 * ffem,
                                        height: 88 * ffem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 136 * fem,
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 2 * fem,
                                            ),
                                            child: Text(
                                              "INCORRECT",
                                              style: SafeGoogleFont(
                                                'Kanit',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.495 * ffem / fem,
                                                color: Color(0xffdc2529),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        'assets/images/cancel.png',
                                        width: 88 * ffem,
                                        height: 88 * ffem,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40 * fem),
                        Text(
                          'CYCLE',
                          style: SafeGoogleFont(
                            'Kanit',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.bold,
                            height: 1.495 * ffem / fem,
                            color: Color(0xff717171),
                          ),
                        ),
                        SizedBox(height: 20 * fem),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: PaginatedDataTable(
                            //columnSpacing: 5,
                            //dataRowHeight: 60,
                            columns: [
                              // DataColumn(
                              //   label: Text(
                              //     'No',
                              //     style: SafeGoogleFont(
                              //       'Kanit',
                              //       fontSize: 20 * ffem,
                              //       fontWeight: FontWeight.bold,
                              //       height: 1.495 * ffem / fem,
                              //       color: Colors.black,
                              //     ),
                              //   ),
                              // ),
                              DataColumn(
                                label: Text(
                                  'Cycle',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Audit',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'StartDate',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'EndDate',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Status',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                            source: dts,
                            onRowsPerPageChanged: (r) {
                              setState(() {
                                if (availableRowsPerPage.contains(r)) {
                                  _rowPerPage = r!;
                                }
                              });
                            },
                            rowsPerPage: _rowPerPage,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DTS extends DataTableSource {
  List<CycleBlock> CycleBlocks = [];
  DTS(this.CycleBlocks);
  void updateCycleBlocks(List<CycleBlock> newCycleBlocks) {
    CycleBlocks.clear();
    CycleBlocks.addAll(newCycleBlocks);
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final CycleBlock cycleBlock = CycleBlocks[index];
    if (index < CycleBlocks.length) {
      return DataRow(
        cells: [
          DataCell(
            SizedBox(
              width: 300,
              child: Text(
                (cycleBlock.cycle!),
                style: SafeGoogleFont(
                  'Kanit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.495,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: 200,
              child: Text(
                (cycleBlock.orgID!),
                style: SafeGoogleFont(
                  'Kanit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.495,
                  color: Color(0xff717171),
                ),
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: 300,
              child: Text(
                (cycleBlock.startDate!),
                style: SafeGoogleFont(
                  'Kanit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.495,
                  color: Color(0xff717171),
                ),
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: 300,
              child: Text(
                (cycleBlock.endDate!),
                style: SafeGoogleFont(
                  'Kanit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.495,
                  color: Color(0xff717171),
                ),
              ),
            ),
          ),
          DataCell(
            SizedBox(
              width: 300,
              child: Text(
                (cycleBlock.status!),
                style: SafeGoogleFont(
                  'Kanit',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.495,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => CycleBlocks.length;

  @override
  int get selectedRowCount => 0;
}
//
