// import 'Manu.dart';
// import 'dashMenu.dart';
//
// class ReportPage extends StatefulWidget {
//   const ReportPage({super.key});
//
//   @override
//   State<ReportPage> createState() => _ReportPageState();
// }
//
// class _ReportPageState extends State<ReportPage> {
//   TextEditingController _searchController = TextEditingController();
//   String _selectedMenu = 'report'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
//   // String _selectedReport = 'Audit Result'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
//   TextEditingController searchController = TextEditingController();
//   String searchText = '';
//   Color defaultBackgroundColor = Color(0xfffca316);
//   Color defaultTextColor = Color(0xffffffff);
//   Color defaultBorderColor = Color(0xfffca316);
//   Color selectedBackgroundColor = Colors.white;
//   Color selectedTextColor = Colors.black;
//   Color selectedBorderColor = Colors.black;
//   String _selectedReport = '';
//   List<Report> reports = [];
//   DTS dts = DTS();
//   int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
//   final _horizontalScrollController = ScrollController();
//   final ReportService reportService = ReportService();
//   Future<List<CycleBlock>> cycleName = CycleService().getCycleBlock();
//   String value = '';
//   String searchFilter = '';
//   bool isDataLoaded = false;
//   late Future<List<CycleBlock>> futureCycle;
//   final CycleService cycleService = CycleService();
//   String listValue = ''; // ค่าเริ่มต้นของ Dropdown
//
//   String? dropdownValue;
//   List<String> dropdownOptions = [
//     'Option 1',
//     'Option 2',
//     'Option 3',
//     // เพิ่มรายการข้อมูลตามที่คุณต้องการ
//   ];
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     futureCycle = cycleService.getCycleBlock();
//     reportf();
//   }
//
//   void reportf() async {
//     final reports = await ReportService().getReport();
//     dts.updateReports((reports));
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double fem = screenWidth / 1920;
//     final double ffem = fem * 0.97;
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size(1920, 68),
//         child: AppBar(
//           title: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 6),
//                 child: Image.asset(
//                   'assets/images/zeenlogoen-1.png',
//                   width: 124.36,
//                   height: 48,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Container(
//                   width: 304,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.fromLTRB(12, 12, 44, 12),
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
//                           // ...
//                         },
//                         icon: Icon(
//                           Icons.search,
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: Color(0xff323131),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(top: 6),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginPage(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 102,
//                   height: 44,
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Color(0xff717171),
//                     ),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.logout,
//                         color: Color(0xff717171),
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         'Logout',
//                         style: TextStyle(
//                           color: Color(0xff717171),
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         child: Row(
//           children: [
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 740 * fem),
//                 width: 220 * fem,
//                 decoration: BoxDecoration(
//                   color: Color(0xff323131),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 227 * fem,
//                       height: 80 * fem,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xffffffff)),
//                         color: Color(0xff323131),
//                       ),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: 16 * fem,
//                             top: 12 * fem,
//                             child: Align(
//                               child: SizedBox(
//                                 width: 56 * fem,
//                                 height: 56 * fem,
//                                 child: Image.asset(
//                                   'assets/images/mask-group.png',
//                                   width: 56 * fem,
//                                   height: 56 * fem,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 88 * fem,
//                             top: 18 * fem,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Auditor01',
//                                   style: SafeGoogleFont(
//                                     'Kanit',
//                                     fontSize: 16 * ffem,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.495 * ffem / fem,
//                                     color: Color(0xffffffff),
//                                   ),
//                                 ),
//                                 Text(
//                                   'ORG: PLUS',
//                                   style: SafeGoogleFont(
//                                     'Kanit',
//                                     fontSize: 14 * ffem,
//                                     fontWeight: FontWeight.w600,
//                                     height: 1.495 * ffem / fem,
//                                     color: Color(0xfffa7003),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 9 * fem),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedMenu = 'dashboard';
//                           if (_selectedMenu == 'dashboard') {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DashboardPage(),
//                               ),
//                             );
//                           }
//                         });
//                       },
//                       child: Container(
//                         padding:
//                         EdgeInsets.fromLTRB(9 * fem, 9 * fem, 0 * fem, 9 * fem),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xff717171)),
//                           color: _selectedMenu == 'dashboard'
//                               ? Colors.orange
//                               : Color(0xff323131),
//                         ),
//                         child: FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
//                                 width: 18 * fem,
//                                 height: 22 * fem,
//                                 child: Image.asset(
//                                   'assets/images/dashboardicon.png',
//                                   width: 18 * fem,
//                                   height: 22 * fem,
//                                 ),
//                               ),
//                               SizedBox(height: 9 * fem),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 106 * fem, 0 * fem),
//                                 child: Text(
//                                   'Dashboard',
//                                   style: SafeGoogleFont(
//                                     'Kanit',
//                                     fontSize: 20 * ffem,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.495 * ffem / fem,
//                                     color: Color(0xffffffff),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 9 * fem),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedMenu = 'cycle';
//                           if (_selectedMenu == 'cycle') {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CycleMenuPage(),
//                               ),
//                             );
//                           }
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(
//                             14 * fem, 9 * fem, 121 * fem, 9 * fem),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xff717171)),
//                           color: _selectedMenu == 'cycle'
//                               ? Colors.orange
//                               : Color(0xff323131),
//                         ),
//                         child: FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
//                                 width: 16 * fem,
//                                 height: 20 * fem,
//                                 child: Image.asset(
//                                   'assets/images/cycleicon.png',
//                                   width: 16 * fem,
//                                   height: 20 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 'Cycle',
//                                 style: SafeGoogleFont(
//                                   'Kanit',
//                                   fontSize: 20 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.495 * ffem / fem,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 9 * fem),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _selectedMenu = 'report';
//                           if (_selectedMenu == 'report') {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ReportPage(),
//                               ),
//                             );
//                           }
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(
//                             14 * fem, 9 * fem, 109 * fem, 9 * fem),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xff717171)),
//                           color: _selectedMenu == 'report'
//                               ? Colors.orange
//                               : Color(0xff323131),
//                         ),
//                         child: FittedBox(
//                           fit: BoxFit.scaleDown,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
//                                 width: 16 * fem,
//                                 height: 20 * fem,
//                                 child: Image.asset(
//                                   'assets/images/reporticon.png',
//                                   width: 16 * fem,
//                                   height: 20 * fem,
//                                 ),
//                               ),
//                               Text(
//                                 'Report',
//                                 style: SafeGoogleFont(
//                                   'Kanit',
//                                   fontSize: 20 * ffem,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.495 * ffem / fem,
//                                   color: Color(0xffffffff),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               // autogroupfx1bF4d (Q5RuU29MZHLT2yQDo5fX1B)
//               padding:
//               EdgeInsets.fromLTRB(8 * fem, 16 * fem, 0 * fem, 20 * fem),
//               height: double.infinity,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     // autogroupusdpNf3 (Q5RpQAazQLr5nSTAqSuSdP)
//                     margin:
//                     EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 0 * fem),
//                     width: 216 * fem,
//                     height: double.infinity,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           // reportuQ5 (1:143)
//                           margin: EdgeInsets.fromLTRB(
//                               16 * fem, 0 * fem, 0 * fem, 16 * fem),
//                           child: Text(
//                             'REPORT',
//                             style: SafeGoogleFont(
//                               'Kanit',
//                               fontSize: 32 * ffem,
//                               fontWeight: FontWeight.w600,
//                               height: 1.495 * ffem / fem,
//                               color: Color(0xff323131),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           // cycleEBT (1:144)
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 12 * fem),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Color(0xffffffff),
//                             borderRadius: BorderRadius.circular(5 * fem),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 // group46VdB (1:217)
//                                 width: double.infinity,
//                                 height: 40 * fem,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xfffca316),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(5 * fem),
//                                     topRight: Radius.circular(5 * fem),
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'Cycle',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 24 * ffem,
//                                       fontWeight: FontWeight.w600,
//                                       height: 1.495 * ffem / fem,
//                                       color: Color(0xffffffff),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 height: 696 * fem,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xffe5e5e5)),
//                                   color: Color(0xffffffff),
//                                   borderRadius: BorderRadius.circular(8.0),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: TextField(
//                                         decoration: InputDecoration(
//                                           hintText: 'ค้นหา Cycle',
//                                           prefixIcon: Icon(Icons.search),
//                                         ),
//                                         onChanged: (value) {
//                                           setState(() {
//                                             searchFilter = value;
//                                           });
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(height: 16),
//                                     Expanded(
//                                       child: FutureBuilder<List<CycleBlock>>(
//                                         future: futureCycle,
//                                         builder: (context, cycles) {
//                                           if (cycles.connectionState == ConnectionState.waiting) {
//                                             return Center(
//                                               child: CircularProgressIndicator(
//                                                 color: Colors.orange,
//                                               ),
//                                             );
//                                           } else if (cycles.hasData) {
//                                             //List<CycleBlock> cycleBlockWithFilter = cycles.data!;
//                                             var cycleBlockWithFilter = cycles.data;
//
//                                             cycleBlockWithFilter = cycleBlockWithFilter!.where((cycle) {
//                                               if (cycle.cycle != null ) {
//                                                 return cycle.cycle!.toUpperCase().contains(searchFilter.toUpperCase().trim());
//                                               }
//                                               return false;
//                                             }).toList();
//                                             return ListView.builder(
//                                               itemCount: cycleBlockWithFilter.length,
//                                               itemBuilder: (BuildContext context, int index) {
//                                                 CycleBlock cycleBlock = cycleBlockWithFilter![index];
//                                                 String value = cycleBlock.cycle!;
//
//                                                 bool isSelected = value == listValue;
//
//                                                 return Container(
//                                                   decoration: BoxDecoration(
//                                                     color: isSelected ? Color.fromRGBO(255, 230, 187, 1.0) : null,
//                                                     borderRadius: BorderRadius.circular(2.0),
//                                                   ),
//                                                   child: Padding(
//                                                     padding: EdgeInsets.only(left: 12 * fem),
//                                                     child: ListTile(
//                                                       title: Text(
//                                                         value,
//                                                         textAlign: TextAlign.center,
//                                                         style: TextStyle(
//                                                           fontSize: 14,
//                                                           fontWeight: FontWeight.w600,
//                                                           height: 1.495,
//                                                           color: isSelected ? Colors.black : Color(0xff717171),
//                                                         ),
//                                                       ),
//                                                       onTap: () {
//                                                         setState(() {
//                                                           listValue = value;
//                                                         });
//                                                       },
//                                                     ),
//                                                   ),
//                                                 );
//                                               },
//                                             );
//                                           } else if (cycles.hasError) {
//                                             return Text('Error: ${cycles.error}');
//                                           } else {
//                                             return Text('No data available');
//                                           }
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // autogroupx7eyQ6V (Q5RqaYniP5wXuPXXmAX7ey)
//                     margin: EdgeInsets.fromLTRB(
//                         0 * fem, 66 * fem, 0 * fem, 0 * fem),
//                     width: 1452 * fem,
//                     height: 910 * fem,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           // frame12icy (1:224)
//                           left: 0 * fem,
//                           top: 39 * fem,
//                           child: Container(
//                             padding: EdgeInsets.fromLTRB(
//                                 4 * fem, 5 * fem, 0 * fem, 4 * fem),
//                             width: 1452,
//                             height: 821,
//                             decoration: BoxDecoration(
//                               border:
//                               Border.all(color: Color(0xff717171)),
//                               color: Color(0xffffffff),
//                             ),
//                             child: ListView(
//                               children: [
//                                 Wrap(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.fromLTRB(
//                                           10 * fem,
//                                           20 * fem,
//                                           0 * fem,
//                                           0 * fem),
//                                       width: 1448 * fem,
//                                       height: 1150 * fem,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             margin: EdgeInsets.only(
//                                                 bottom: 14 * fem),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .spaceBetween,
//                                               children: [
//                                                 //SizedBox(width: 10), // เพิ่มส่วนนี้เพื่อเว้นระยะห่างระหว่างปุ่ม Filter และปุ่ม Search
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 5,
//                                                     ),
//                                                     Container(
//                                                       width: 104,
//                                                       height: 46,
//                                                       child:
//                                                       DropdownButtonFormField<
//                                                           String>(
//                                                         value:
//                                                         dropdownValue,
//                                                         onChanged: (String?
//                                                         newValue) {
//                                                           setState(() {
//                                                             dropdownValue =
//                                                                 newValue;
//                                                           });
//                                                         },
//                                                         items: dropdownOptions
//                                                             .map((String
//                                                         value) {
//                                                           return DropdownMenuItem<
//                                                               String>(
//                                                             value: value,
//                                                             child: Text(
//                                                                 value),
//                                                           );
//                                                         }).toList(),
//                                                         decoration:
//                                                         InputDecoration(
//                                                           labelText:
//                                                           'Dropdown',
//                                                           border:
//                                                           OutlineInputBorder(),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 24,
//                                                     ),
//                                                     Container(
//                                                       width: 349,
//                                                       height: 40,
//                                                       decoration:
//                                                       BoxDecoration(
//                                                         color:
//                                                         Colors.white,
//                                                         borderRadius:
//                                                         BorderRadius
//                                                             .circular(
//                                                             4),
//                                                         border:
//                                                         Border.all(
//                                                           color:
//                                                           Colors.grey,
//                                                           width: 1,
//                                                         ),
//                                                       ),
//                                                       child: TextField(
//                                                         controller:
//                                                         searchController,
//                                                         decoration:
//                                                         InputDecoration(
//                                                           hintText:
//                                                           'Search',
//                                                           border:
//                                                           InputBorder
//                                                               .none,
//                                                           contentPadding:
//                                                           EdgeInsets
//                                                               .fromLTRB(
//                                                               12,
//                                                               12,
//                                                               44,
//                                                               12),
//                                                           suffixIcon:
//                                                           IconButton(
//                                                             onPressed:
//                                                                 () {
//                                                               // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
//                                                               // ...
//                                                             },
//                                                             icon: Icon(
//                                                               Icons
//                                                                   .search,
//                                                               size: 24,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           FutureBuilder(
//                                             future: reportService.getReport(),
//                                             builder: (context, snapshot) {
//                                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                                 return Center(
//                                                   child: SpinKitDualRing(
//                                                     color: Colors.orange,
//                                                     size: 60.0,
//                                                   ),
//                                                 );
//                                               } else if (snapshot.hasError) {
//                                                 return Center(
//                                                   child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
//                                                 );
//                                               } else if (snapshot.hasData) {
//                                                 final reportData = snapshot.data;
//                                                 return SingleChildScrollView(
//                                                   controller: _horizontalScrollController,
//                                                   child: PaginatedDataTable(
//                                                     columns: const [
//                                                       DataColumn(label: Text("Cycle")),
//                                                       DataColumn(label: Text("AuditID")),
//                                                       DataColumn(label: Text("AuditStatus")),
//                                                       DataColumn(label: Text("FoundStatus")),
//                                                       DataColumn(label: Text("DcID")),
//                                                       DataColumn(label: Text("DcName")),
//                                                       DataColumn(label: Text("ShopID")),
//                                                       DataColumn(label: Text("ShopName")),
//                                                       DataColumn(label: Text("ShopSegment")),
//                                                       DataColumn(label: Text("Region")),
//                                                       DataColumn(label: Text("Province")),
//                                                       DataColumn(label: Text("PageID")),
//                                                       DataColumn(label: Text("GroupID")),
//                                                       DataColumn(label: Text("QuestionID")),
//                                                       DataColumn(label: Text("Topic")),
//                                                       DataColumn(label: Text("Title")),
//                                                       DataColumn(label: Text("Module")),
//                                                       DataColumn(label: Text("Score")),
//                                                       //DataColumn(label: Text("OverallImageUrl")),
//                                                       DataColumn(label: Text("FinalAnswer")),
//                                                       DataColumn(label: Text("AutoAnswer")),
//                                                       DataColumn(label: Text("AnswerBy")),
//                                                       DataColumn(label: Text("AnswerDiff")),
//                                                       DataColumn(label: Text("ShelfShareDiff")),
//                                                       DataColumn(label: Text("PopDiff")),
//                                                       DataColumn(label: Text("ClusterDiff")),
//                                                       DataColumn(label: Text("ShelfLayoutDiff")),
//                                                       DataColumn(label: Text("IsAISkipped")),
//                                                       DataColumn(label: Text("ChallengeBy")),
//                                                       DataColumn(label: Text("AutoQuestion")),
//                                                       DataColumn(label: Text("DetectionStatus")),
//                                                       DataColumn(label: Text("SubmitByAuditorID")),
//                                                       DataColumn(label: Text("UpdateByAuditorID")),
//                                                       DataColumn(label: Text("CheckInDateTime")),
//                                                       DataColumn(label: Text("CheckOutDateTime")),
//                                                       DataColumn(label: Text("UpdateDateTime")),
//                                                       DataColumn(label: Text("QuestionTags")),
//                                                       DataColumn(label: Text("ScoreTags")),
//                                                       DataColumn(label: Text("QuestionRef1")),
//                                                       DataColumn(label: Text("QuestionRef2")),
//                                                       DataColumn(label: Text("ShopRef1")),
//                                                       DataColumn(label: Text("ShopRef2")),
//                                                       DataColumn(label: Text("BasketRef1")),
//                                                       DataColumn(label: Text("BasketRef2")),
//                                                       DataColumn(label: Text("AIAnswer")),
//                                                     ],
//                                                     source: dts,
//                                                     onRowsPerPageChanged: (r) {
//                                                       setState(() {
//                                                         _rowPerPage = r!;
//                                                       });
//                                                     },
//                                                     rowsPerPage: _rowPerPage,
//                                                   ),
//                                                 );
//                                               } else {
//                                                 return SizedBox();
//                                               }
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // group52YQ9 (1:534)
//                           left: 0 * fem,
//                           top: 0 * fem,
//                           child: Container(
//                             width: 1232 * fem,
//                             height: 40 * fem,
//                             child: Row(
//                               crossAxisAlignment:
//                               CrossAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       _selectedReport = 'Audit Result';
//                                     });
//                                   },
//                                   child: Container(
//                                     width: 144 * fem,
//                                     height: double.infinity,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: _selectedReport ==
//                                             'Audit Result'
//                                             ? selectedBorderColor
//                                             : defaultBorderColor,
//                                       ),
//                                       color: _selectedReport ==
//                                           'Audit Result'
//                                           ? selectedBackgroundColor
//                                           : defaultBackgroundColor,
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(5 * fem),
//                                         topRight:
//                                         Radius.circular(5 * fem),
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         'Audit Result',
//                                         textAlign: TextAlign.center,
//                                         style: SafeGoogleFont(
//                                           'Kanit',
//                                           fontSize: 16 * ffem,
//                                           fontWeight: FontWeight.w600,
//                                           height: 1.495 * ffem / fem,
//                                           color: _selectedReport ==
//                                               'Audit Result'
//                                               ? selectedTextColor
//                                               : defaultTextColor,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.fromLTRB(
//                                       8 * fem, 0 * fem, 0 * fem, 0 * fem),
//                                   height: double.infinity,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport =
//                                             'Audit Overview';
//                                             FutureBuilder(
//                                               future: reportService
//                                                   .getReport(),
//                                               builder:
//                                                   (context, snapshot) {
//                                                 if (snapshot
//                                                     .connectionState ==
//                                                     ConnectionState
//                                                         .waiting) {
//                                                   return const Center(
//                                                     child:
//                                                     SpinKitDualRing(
//                                                       color:
//                                                       Colors.orange,
//                                                       size: 60.0,
//                                                     ),
//                                                   );
//                                                 } else if (snapshot
//                                                     .hasError) {
//                                                   return Center(
//                                                     child: Text(
//                                                         'เกิดข้อผิดพลาด: ${snapshot.error}'),
//                                                   );
//                                                 } else {
//                                                   return Center(
//                                                     child: Image.asset(
//                                                       'assets/images/zeenlogoen-1.png',
//                                                       width: 251,
//                                                       height: 283,
//                                                     ),
//                                                   );
//                                                 }
//                                               },
//                                             );
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'Audit Overview'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'Audit Overview'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'Audit Overview',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'Audit Overview'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 8 * fem),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport =
//                                             'Basket Overview';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'Basket Overview'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'Basket Overview'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'Basket Overview',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'Basket Overview'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 8 * fem),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport =
//                                             'Shop Compliance';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'Shop Compliance'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'Shop Compliance'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'Shop Compliance',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'Shop Compliance'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 8 * fem,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport = 'OOS';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'OOS'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'OOS'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'OOS',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'OOS'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 8 * fem,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport = 'OSA';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'OSA'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'OSA'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'OSA',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'OSA'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 8 * fem,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport =
//                                             'Share Of Shelf';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'Share Of Shelf'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'Share Of Shelf'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'Share Of Shelf',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'Share Of Shelf'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 8 * fem,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             _selectedReport = 'Score';
//                                           });
//                                         },
//                                         child: Container(
//                                           width: 144 * fem,
//                                           height: 39 * fem,
//                                           decoration: BoxDecoration(
//                                             border: Border.all(
//                                               color: _selectedReport ==
//                                                   'Score'
//                                                   ? selectedBorderColor
//                                                   : defaultBorderColor,
//                                             ),
//                                             color: _selectedReport ==
//                                                 'Score'
//                                                 ? selectedBackgroundColor
//                                                 : defaultBackgroundColor,
//                                             borderRadius:
//                                             BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                   5 * fem),
//                                               topRight: Radius.circular(
//                                                   5 * fem),
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               'Score',
//                                               textAlign: TextAlign.center,
//                                               style: SafeGoogleFont(
//                                                 'Kanit',
//                                                 fontSize: 16 * ffem,
//                                                 fontWeight:
//                                                 FontWeight.w600,
//                                                 height:
//                                                 1.495 * ffem / fem,
//                                                 color: _selectedReport ==
//                                                     'Score'
//                                                     ? selectedTextColor
//                                                     : defaultTextColor,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ), //
//     );
//   }
// }
//
//
//
// class DTS extends DataTableSource {
//   List<Report> reports = [];
//
//   void updateReports(List<Report> newReports) {
//     reports.clear();
//     reports.addAll(newReports);
//     notifyListeners();
//   }
//
//   @override
//   DataRow getRow(int index) {
//     // ตรวจสอบว่ามีข้อมูลในรายการ reports หรือไม่
//     // if (index >= reports.length) return null;
//     final Report report = reports[index];
//     OverlayEntry? overlayEntry; // ประกาศตัวแปร overlayEntry แบบ nullable
//
//     return DataRow(
//       cells: [
//         DataCell(
//           Row(
//             children: [
//               report.OverallImageUrl != null
//                   ? Tooltip(
//                 message: 'View Image',
//                 child: GestureDetector(
//                   onTap: () {
//                     showDialog(
//                       context: context as BuildContext,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           content: Container(
//                             width: 300,
//                             height: 300,
//                             child: Image.network(report.OverallImageUrl!),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Icon(Icons.image),
//                 ),
//               )
//                   : SizedBox(),
//               Text(report.Cycle ?? ''),
//             ],
//           ),
//         ),
//         DataCell(Text(report.AuditID ?? '')),
//         DataCell(Text( report.AuditStatus ?? '')),
//         DataCell(Text( report.FoundStatus ?? '')),
//         DataCell(Text( report.DcID ?? '')),
//         DataCell(Text( report.DcName ?? '')),
//         DataCell(Text( report.ShopID ?? '')),
//         DataCell(Text( report.ShopName ?? '')),
//         DataCell(Text( report.ShopSegment ?? '')),
//         DataCell(Text( report.Region ?? '')),
//         DataCell(Text( report.Province ?? '')),
//         DataCell(Text( report.PageID ?? '')),
//         DataCell(Text( report.GroupID ?? '')),
//         DataCell(Text( report.QuestionID ?? '')),
//         DataCell(Text( report.Topic ?? '')),
//         DataCell(Text( report.Title ?? '')),
//         DataCell(Text( report.Module ?? '')),
//         DataCell(Text( report.Score != null ?  report.Score.toString() : '')),
//         //DataCell(Text(Report.OverallImageUrl ?? '')),
//         DataCell(Text( report.FinalAnswer ?? '')),
//         DataCell(Text( report.AutoAnswer ?? '')),
//         DataCell(Text( report.AnswerBy ?? '')),
//         DataCell(Text( report.AnswerDiff ?? '')),
//         DataCell(Text( report.ShelfShareDiff ?? '')),
//         DataCell(Text( report.PopDiff ?? '')),
//         DataCell(Text( report.ClusterDiff ?? '')),
//         DataCell(Text( report.ShelfLayoutDiff ?? '')),
//         DataCell(Text( report.IsAISkipped ?? '')),
//         DataCell(Text( report.ChallengeBy ?? '')),
//         DataCell(Text( report.AutoQuestion ?? '')),
//         DataCell(Text( report.DetectionStatus ?? '')),
//         DataCell(Text( report.SubmitByAuditorID ?? '')),
//         DataCell(Text( report.UpdateByAuditorID ?? '')),
//         DataCell(Text( report.CheckInDateTime ?? '')),
//         DataCell(Text( report.CheckOutDateTime ?? '')),
//         DataCell(Text( report.UpdateDateTime ?? '')),
//         DataCell(Text( report.QuestionTags ?? '')),
//         DataCell(Text( report.ScoreTags ?? '')),
//         DataCell(Text( report.QuestionRef1 ?? '')),
//         DataCell(Text( report.QuestionRef2 ?? '')),
//         DataCell(Text( report.ShopRef1 ?? '')),
//         DataCell(Text( report.ShopRef2 ?? '')),
//         DataCell(Text( report.BasketRef1 ?? '')),
//         DataCell(Text( report.BasketRef2 ?? '')),
//         DataCell(Text( report.AIAnswer ?? '')),
//       ],
//     );
//   }
//
//   @override
//   bool get isRowCountApproximate => false;
//
//   @override
//   int get rowCount => reports.length;
//
//   @override
//   int get selectedRowCount => 0;
// }
