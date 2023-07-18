import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multiselect/multiselect.dart';

import '../Domain/component_cycle.dart';
import '../Domain/service_cycle.dart';
import '../utils.dart';
// Sample card data class

class CardData {
  final String status;

  CardData(this.status);
}

// Populate the card data
List<CardData> cardsData = [
  CardData("DONE"),
  CardData("IN_PROGRESS"),
  CardData("CANCEL"),
  CardData("NEW CYCLE"),
];

class CycleScreen extends StatefulWidget {
  const CycleScreen({super.key});

  @override
  State<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends State<CycleScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _issearchconTextNotEmpty = false;
  List<String> _items = ['DONE', 'IN_PROGRESS', 'NEW CYCLE', 'CANCEL'];
  TextEditingController _cycleController = TextEditingController();
  final _horizontalScrollController = ScrollController();
  List<CycleBlock> filteredCycleBlocks = [];
  DateTime? selectedStartDate;
  DateTime? selectedDateEnd;
  String searchFilter = '';
  late Future<List<CycleBlock>> futureCycle;
  final CycleService cycleService = CycleService();
  List<CycleBlock> cycleBlocks = [];
  List<String> selectedCycleStatus = [];
  int totalCycleBlocks = 1;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    filteredCycleBlocks = [];
    futureCycle = cycleService.getCycleBlock();
    // cyclef();
  }

  void _searchClearText() {
    _cycleController.clear();
    setState(() {
      _issearchconTextNotEmpty = false;
    });
  }

  Future<void> cyclef() async {
    try {
      List<CycleBlock> data = await cycleService.getCycleBlock();
      setState(() {
        cycleBlocks = data; // กำหนดค่าข้อมูลให้กับตัวแปร cycleBlocks
        filteredCycleBlocks =
            cycleBlocks; // กำหนดค่าข้อมูลเริ่มต้นให้กับตัวแปร filteredCycleBlocks
      });
    } catch (error) {
      print("Error: $error");
    }
  }

  void _resetFilters() {
    setState(() {
      _cycleController.text = ''; // รีเซ็ตค่าใน TextField ที่เกี่ยวข้อง
      selectedStartDate = null; // รีเซ็ตค่าเลือกวันที่เริ่มต้น
      selectedDateEnd = null; // รีเซ็ตค่าเลือกวันที่สิ้นสุด
      selectedCycleStatus = []; // รีเซ็ตค่าเลือกสถานะ Cycle
      searchFilter = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / 1920;
    final double ffem = fem * 0.97;
    int doneCount = 0;
    int cancelCount = 0;
    int newCount = 0;
    int inprogressCount = 0;

    for (var cardData in cardsData) {
      if (cardData.status == "DONE") {
        // Check if the status is "DONE"
        doneCount++; // Increment the count for "DONE" statuses
      } else if (cardData.status == "CANCEL") {
        cancelCount++;
      } else if (cardData.status == "IN_PROGRESS") {
        inprogressCount++;
      } else if (cardData.status == "NEW CYCLE") {
        newCount++;
      }
    }
    // int inProgressCount = filteredCycleBlocks
    //     .where((block) => block.status == "IN_PROGRESS")
    //     .length;
    // int newCycleCount = filteredCycleBlocks
    //     .where((block) => block.status == "NEW_CYCLE")
    //     .length;
    // // int doneCount =
    // //     filteredCycleBlocks.where((block) => block.status == "DONE").length;
    // int incorrectCount =
    //     filteredCycleBlocks.where((block) => block.status == "CANCEL").length;

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
        });
      }
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
        });
      }
    }

    return Expanded(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromRGBO(93, 176, 243, 1),
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
                              Container(
                                width: 94 * fem,
                                height: 94 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/all cycle.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "$inprogressCount",
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
                              Container(
                                width: 94 * fem,
                                height: 94 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/inprogress.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "$newCount",
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
                              Container(
                                width: 94 * fem,
                                height: 94 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/new1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "$doneCount", // Display the count of "DONE" statuses
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
                              Container(
                                width: 94 * fem,
                                height: 94 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/done.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 2 * fem,
                                    ),
                                    child: Text(
                                      "CANCEL CYCLE",
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
                                    "$cancelCount",
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
                              Container(
                                width: 94 * fem,
                                height: 94 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/cancel.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 12, 44, 12),
                                suffixIcon: _issearchconTextNotEmpty
                                    ? IconButton(
                                        onPressed: _searchClearText,
                                        icon: Icon(
                                          Icons.cancel,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchFilter = value;
                                  _issearchconTextNotEmpty = value.isNotEmpty;
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
                              child: Row(
                                children: [
                                  SizedBox(width: 4),
                                  if (selectedStartDate == null)
                                    Text(
                                      'Filter By StartDate',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  if (selectedStartDate != null)
                                    Text(
                                      '${selectedStartDate?.day}/${selectedStartDate?.month}/${selectedStartDate?.year}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  //Text('Filtter By StartDate //selectedStartDate',style: TextStyle(color: Colors.black),),
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
                              child: Row(
                                children: [
                                  SizedBox(width: 4),
                                  if (selectedDateEnd == null)
                                    Text(
                                      'Filter By EndDate',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  if (selectedDateEnd != null)
                                    Text(
                                      '${selectedDateEnd?.day}/${selectedDateEnd?.month}/${selectedDateEnd?.year}',
                                      style: TextStyle(color: Colors.black),
                                    ),
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
                              borderRadius: BorderRadius.circular(
                                  6), // กำหนดรูปร่างเป็นวงกลม
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1), // สีเงา
                                  spreadRadius: 2, // การกระจายของเงา
                                  blurRadius: 4, // ความกว้างของเงา
                                  offset: Offset(0, 2), // ตำแหน่งเงาแนวแกน x, y
                                ),
                              ],
                            ),
                            child: DropDownMultiSelect(
                              onChanged: (List<String> x) {
                                setState(() {
                                  selectedCycleStatus = x;
                                });
                              },
                              options: _items,
                              selectedValues: selectedCycleStatus,
                              whenEmpty: 'Select Something',
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: ElevatedButton(
                              onPressed:
                                  _resetFilters, // เรียกใช้งานฟังก์ชัน _resetFilters()
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text(
                                    'Reset',
                                    style: TextStyle(color: Colors.black),
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
                SizedBox(height: 20 * fem),
                FutureBuilder<List<CycleBlock>>(
                  future: futureCycle,
                  builder: (context, cycles) {
                    if (cycles.hasData) {
                      //List<CycleBlock> filteredCycleBlocks = snapshot.data!;
                      var cycleBlockWithFilter = cycles.data;

                      cycleBlockWithFilter =
                          cycleBlockWithFilter!.where((cycle) {
                        if (cycle.cycle != null) {
                          return cycle.cycle!
                              .toUpperCase()
                              .contains(searchFilter.toUpperCase().trim());
                        }
                        return false;
                      }).toList();

                      cycleBlockWithFilter =
                          cycleBlockWithFilter.where((cycle) {
                        if (selectedStartDate == null) {
                          return true;
                        } else if (cycle.startDate != null) {
                          DateTime cycleStartDate =
                              DateTime.parse(cycle.startDate!);
                          return cycleStartDate
                              .isAtSameMomentAs(selectedStartDate!);
                        }
                        return false;
                      }).toList();
                      //
                      cycleBlockWithFilter =
                          cycleBlockWithFilter.where((cycle) {
                        if (selectedDateEnd == null) {
                          return true;
                        } else if (cycle.endDate != null) {
                          DateTime cycleStartDate =
                              DateTime.parse(cycle.endDate!);
                          return cycleStartDate
                              .isAtSameMomentAs(selectedDateEnd!);
                        }
                        return false;
                      }).toList();

                      cycleBlockWithFilter =
                          cycleBlockWithFilter.where((cycle) {
                        if (selectedCycleStatus.isEmpty) {
                          return true;
                        } else if (selectedCycleStatus
                            .contains(cycle.status!)) {
                          return true;
                        }
                        return false;
                      }).toList();
                      //totalCycleBlocks = cycleBlockWithFilter.length;

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _horizontalScrollController,
                        child: DataTable(
                          headingRowHeight: 44.0 * fem,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(249, 225, 185, 1)),
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
                          rows: List<DataRow>.generate(
                              cycleBlockWithFilter.length, (index) {
                            CycleBlock cycleBlock =
                                cycleBlockWithFilter![index];
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
                                      cycleBlock.org!,
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
                                  Container(
                                    width: 100 * fem,
                                    height: 30 * fem,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: cycleBlock.getStatusColor()),
                                        color: cycleBlock.getStatusColor(),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem)),
                                    child: Center(
                                      child: SizedBox(
                                        width: 300 * fem,
                                        child: Text(
                                          cycleBlock.status!,
                                          style: SafeGoogleFont(
                                            'Kanit',
                                            fontSize: 16 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.495 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    } else if (cycles.hasError) {
                      return Text("Error: ${cycles.error}");
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
    );
  }
}
