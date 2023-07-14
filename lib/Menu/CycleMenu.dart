import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intern_yellow_box/utils.dart';
import '../Domain/component_cycle.dart';
import '../Domain/service_cycle.dart';

// class FilterOption {
//   final String title;
//   final List<SubFilterOption> subFilters;
//
//   FilterOption({
//     required this.title,
//     required this.subFilters,
//   });
// }
//
// class SubFilterOption {
//   final String title;
//   bool isSelected;
//
//   SubFilterOption({
//     required this.title,
//     this.isSelected = false,
//   });
// }

class CycleMenuPage extends StatefulWidget {
  //const CycleMenuPage({required Key key}) : super(key: key);

  @override
  State<CycleMenuPage> createState() => _CycleMenuPageState();
}

class _CycleMenuPageState extends State<CycleMenuPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedMenu = 'cycle'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
  List<CycleBlock> cycleBlocks = []; // สร้างรายการข้อมูลสำหรับ CycleBlock
  final _horizontalScrollController = ScrollController();
  final CycleService cycleService = CycleService();
  List<CycleBlock> filteredCycleBlocks = [];
  TextEditingController _cycleController = TextEditingController();
  List<String> _items = ['DONE', 'IN PROGRESS', 'NEW CYCLE', 'CANCLE'];
  List<bool> _selectedItems = List.filled(4, false);
  DateTime? selectedStartDate;
  DateTime? selectedDateEnd;
  




  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    filteredCycleBlocks = [];
    cyclef();
  }

  // void cyclef() async {
  //   cycleBlocks = await CycleService().getCycleBlock();
  // }

  Future<void> cyclef() async {
    try {
      List<CycleBlock> data = await cycleService.getCycleBlock();
      setState(() {
        cycleBlocks = data; // กำหนดค่าข้อมูลให้กับตัวแปร cycleBlocks
        filteredCycleBlocks = cycleBlocks; // กำหนดค่าข้อมูลเริ่มต้นให้กับตัวแปร filteredCycleBlocks
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  void filterDataByDate1(DateTime startDate) {
    setState(() {
      filteredCycleBlocks = filteredCycleBlocks.where((cycle) {
        if (cycle.startDate != null) {
          DateTime cycleStartDate = DateTime.parse(cycle.startDate!);
          return cycleStartDate.isAtSameMomentAs(startDate);
        }
        return false;
      }).toList();
    });
  }
  Future<void> _selectDateStart(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        selectedStartDate = pickedDate;
        print(pickedDate);
      });
      filterDataByDate1(selectedStartDate!);
    }
  }

  void filterDataByDate2(DateTime startDate) {
    setState(() {
      filteredCycleBlocks = filteredCycleBlocks.where((cycle) {
        if (cycle.startDate != null) {
          DateTime cycleStartDate = DateTime.parse(cycle.startDate!);
          return cycleStartDate.isAtSameMomentAs(startDate);
        }
        return false;
      }).toList();
    });
  }
  Future<void> _selectDateEnd(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDateEnd ?? DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDateEnd = pickedDate;
        print(pickedDate);
      });
      filterDataByDate2(selectedDateEnd!);
    }
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / 1920;
    final double ffem = fem * 0.97;

    int totalCycleBlocks = filteredCycleBlocks.length;
    int inProgressCount = filteredCycleBlocks.where((block) => block.status == "IN_PROGRESS").length;
    int newCycleCount = filteredCycleBlocks.where((block) => block.status == "NEW_CYCLE").length;
    int doneCount = filteredCycleBlocks.where((block) => block.status == "DONE").length;//
    int incorrectCount = filteredCycleBlocks.where((block) => block.status == "CANCEL").length;


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
                              height: 140 * fem,
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
                                            "$totalCycleBlocks",
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 140 * fem,
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
                                            "$inProgressCount",
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 140 * fem,
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
                                            "$newCycleCount",
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 140 * fem,
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
                                            "$doneCount",
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 312 * fem,
                              height: 140 * fem,
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
                                            "$incorrectCount",
                                            style: SafeGoogleFont(
                                              'Kanit',
                                              fontSize: 34 * ffem,
                                              fontWeight: FontWeight.bold,
                                              height: 1.495 * ffem / fem,
                                              color: Color(0xff717171),
                                            ),
                                          ),
                                        ], //
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Container(
                              width: 200,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'CYCLE',
                                  style: SafeGoogleFont(
                                    'Kanit',
                                    fontSize: 32 * ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.495 * ffem / fem,
                                    color: Color(0xff717171),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 200,
                                    child: TextField(
                                      controller: _cycleController,
                                      decoration: InputDecoration(
                                        hintText: 'Search By Cycle',
                                        contentPadding: EdgeInsets.fromLTRB(12, 12, 44, 12),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.search,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          filteredCycleBlocks = cycleBlocks.where((block) {
                                            return block.cycle!.toLowerCase().contains(value.toLowerCase());
                                          }).toList();
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: ElevatedButton(
                                      onPressed: () => _selectDateStart(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          SizedBox(width: 4),
                                          Text('Filtter By StartDate',style: TextStyle(color: Colors.black),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: ElevatedButton(
                                      onPressed: () => _selectDateEnd(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          SizedBox(width: 4),
                                          Text('Filtter By EndDate',style: TextStyle(color: Colors.black),),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    width: 200,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white, // สีพื้นหลัง
                                      borderRadius: BorderRadius.circular(6), // กำหนดรูปร่างเป็นวงกลม
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // สีเงา
                                          spreadRadius: 2, // การกระจายของเงา
                                          blurRadius: 4, // ความกว้างของเงา
                                          offset: Offset(0, 2), // ตำแหน่งเงาแนวแกน x, y
                                        ),
                                      ],
                                    ),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Text('Filter By Status'),
                                      items: _items.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                value: _selectedItems[_items.indexOf(item)],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _selectedItems[_items.indexOf(item)] = value ?? false;
                                                  });
                                                },
                                              ),
                                              Text(item),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        // No action required when an item in the multiselect dropdown is selected
                                      },
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // ทำสิ่งที่ต้องการเมื่อปุ่ม submit ถูกคลิก
                                        // เช่น ประมวลผลการกรองข้อมูล
                                        // หรือแสดงผลลัพธ์ที่กรองแล้ว
                                      },
                                      child: Text('Submit'),
                                    ),
                                  ),

                                ],
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 20 * fem),
              FutureBuilder<List<CycleBlock>>(
                future: cycleService.getCycleBlock(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                     //List<CycleBlock> filteredCycleBlocks = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _horizontalScrollController,
                      child: DataTable(
                        headingRowHeight: 44.0 * fem,
                        headingRowColor:
                        MaterialStateColor.resolveWith((states) => Color.fromRGBO(249, 225, 185, 1)),
                        columns: [
                          DataColumn(
                            label: SizedBox(
                              width: 50 * fem,
                              child: Text(
                                'No',
                                style: SafeGoogleFont(
                                  'Kanit',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.495 * ffem / fem,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 300 * fem,
                              child: Text(
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
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 200 * fem,
                              child: Text(
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
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 300 * fem,
                              child: Text(
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
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 300 * fem,
                              child: Text(
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
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 300 * fem,
                              child: Text(
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
                          ),
                        ],
                        rows: List<DataRow>.generate(filteredCycleBlocks.length, (index) {
                          CycleBlock cycleBlock = filteredCycleBlocks[index];
                          int Number = index + 1;
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 50 * fem,
                                  child: Text(
                                    '$Number',
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),


                              DataCell(
                                SizedBox(
                                  width: 300 * fem,
                                  child: Text(
                                    cycleBlock.cycle!,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 200 * fem,
                                  child: Text(
                                    cycleBlock.orgID!,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 300 * fem,
                                  child: Text(
                                    cycleBlock.startDate!,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 300 * fem,
                                  child: Text(
                                    cycleBlock.endDate!,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 300 * fem,
                                  child: Text(
                                    cycleBlock.status!,
                                    style: SafeGoogleFont(
                                      'Kanit',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.495 * ffem / fem,
                                      color: Color(0xff717171),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return const Center(
                      child: SpinKitDualRing(
                        color: Colors.orange,
                        size: 60.0,
                      ),
                    );
                  }
                },
              )
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
  }//
}
