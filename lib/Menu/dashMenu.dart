// import 'package:flutter/material // import '../utils.dart';
// // // import 'CycleMenu.dart';
// // //
// // // class DashboardPage extends StatefulWidget {
// // //   const DashboardPage({super.key});
// // //
// // //   @override
// // //   State<DashboardPage> createState() => _DashboardPageState();
// // // }
// // //
// // // class _DashboardPageState extends State<DashboardPage> {
// // //   TextEditingController _searchController = TextEditingController();
// // //   String _selectedMenu = 'dashboard'; // เพิ่มตัวแปรเพื่อเก็บเมนูที่ถูกเลือก//
// // //
// // //   @override
// // //   void dispose() {
// // //     _searchController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final double screenHeight = MediaQuery.of(context).size.height;
// // //     final double screenWidth = MediaQuery.of(context).size.width;
// // //     final double fem = screenWidth / 1920;
// // //     final double ffem = fem * 0.97;
// // //
// // //     return Scaffold(
// // //       appBar: PreferredSize(
// // //         preferredSize: Size(1920, 68),
// // //         child: AppBar(
// // //           title: Row(
// // //             children: [
// // //               Padding(
// // //                 padding: const EdgeInsets.only(top: 6),
// // //                 child: Image.asset(
// // //                   'assets/images/zeenlogoen-1.png',
// // //                   width: 124.36,
// // //                   height: 48,
// // //                 ),
// // //               ),
// // //               SizedBox(width: 8),
// // //               Expanded(
// // //                 child: Container(
// // //                   width: 304,
// // //                   height: 40,
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(4),
// // //                   ),
// // //                   child: TextField(
// // //                     controller: _searchController,
// // //                     decoration: InputDecoration(
// // //                       hintText: 'Search',
// // //                       border: InputBorder.none,
// // //                       contentPadding: EdgeInsets.fromLTRB(12, 12, 44, 12),
// // //                       suffixIcon: IconButton(
// // //                         onPressed: () {
// // //                           // คำสั่งที่ต้องการเมื่อกดปุ่มค้นหา
// // //                           // ...
// // //                         },
// // //                         icon: Icon(
// // //                           Icons.search,
// // //                           size: 24,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           backgroundColor: Color(0xff323131),
// // //           actions: [
// // //             Padding(
// // //               padding: const EdgeInsets.only(top: 6),
// // //               child: InkWell(
// // //                 onTap: () {
// // //                   Navigator.pushReplacement(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (context) => LoginPage(),
// // //                     ),
// // //                   );
// // //                 },
// // //                 child: Container(
// // //                   width: 102,
// // //                   height: 44,
// // //                   padding: EdgeInsets.all(8),
// // //                   decoration: BoxDecoration(
// // //                     border: Border.all(
// // //                       color: Color(0xff717171),
// // //                     ),
// // //                     borderRadius: BorderRadius.circular(4),
// // //                   ),
// // //                   child: Row(
// // //                     children: [
// // //                       Icon(
// // //                         Icons.logout,
// // //                         color: Color(0xff717171),
// // //                       ),
// // //                       SizedBox(width: 4),
// // //                       Text(
// // //                         'Logout',
// // //                         style: TextStyle(
// // //                           color: Color(0xff717171),
// // //                           fontSize: 14,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       body: Container(
// // //         child: Row(
// // //           children: [
// // //             SingleChildScrollView(
// // //               child: Container(
// // //                 padding: EdgeInsets.fromLTRB(0, 0, 0, 740 * fem),
// // //                 width: 220 * fem,
// // //                 decoration: BoxDecoration(
// // //                   color: Color(0xff323131),
// // //                 ),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Container(
// // //                       width: 227 * fem,
// // //                       height: 80 * fem,
// // //                       decoration: BoxDecoration(
// // //                         border: Border.all(color: Color(0xffffffff)),
// // //                         color: Color(0xff323131),
// // //                       ),
// // //                       child: Stack(
// // //                         children: [
// // //                           Positioned(
// // //                             left: 16 * fem,
// // //                             top: 12 * fem,
// // //                             child: Align(
// // //                               child: SizedBox(
// // //                                 width: 56 * fem,
// // //                                 height: 56 * fem,
// // //                                 child: Image.asset(
// // //                                   'assets/images/mask-group.png',
// // //                                   width: 56 * fem,
// // //                                   height: 56 * fem,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                           Positioned(
// // //                             left: 88 * fem,
// // //                             top: 18 * fem,
// // //                             child: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Text(
// // //                                   'Auditor01',
// // //                                   style: SafeGoogleFont(
// // //                                     'Kanit',
// // //                                     fontSize: 16 * ffem,
// // //                                     fontWeight: FontWeight.w400,
// // //                                     height: 1.495 * ffem / fem,
// // //                                     color: Color(0xffffffff),
// // //                                   ),
// // //                                 ),
// // //                                 Text(
// // //                                   'ORG: PLUS',
// // //                                   style: SafeGoogleFont(
// // //                                     'Kanit',
// // //                                     fontSize: 14 * ffem,
// // //                                     fontWeight: FontWeight.w600,
// // //                                     height: 1.495 * ffem / fem,
// // //                                     color: Color(0xfffa7003),
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 9 * fem),
// // //                     InkWell(
// // //                       onTap: () {
// // //                         setState(() {
// // //                           _selectedMenu = 'dashboard';
// // //                           if (_selectedMenu == 'dashboard') {
// // //                             Navigator.pushReplacement(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (context) => DashboardPage(),
// // //                               ),
// // //                             );
// // //                           }
// // //                         });
// // //                       },
// // //                       child: Container(
// // //                         padding:
// // //                         EdgeInsets.fromLTRB(9 * fem, 9 * fem, 0 * fem, 9 * fem),
// // //                         width: double.infinity,
// // //                         decoration: BoxDecoration(
// // //                           border: Border.all(color: Color(0xff717171)),
// // //                           color: _selectedMenu == 'dashboard'
// // //                               ? Colors.orange
// // //                               : Color(0xff323131),
// // //                         ),
// // //                         child: FittedBox(
// // //                           fit: BoxFit.scaleDown,
// // //                           child: Row(
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(
// // //                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
// // //                                 width: 18 * fem,
// // //                                 height: 22 * fem,
// // //                                 child: Image.asset(
// // //                                   'assets/images/dashboardicon.png',
// // //                                   width: 18 * fem,
// // //                                   height: 22 * fem,
// // //                                 ),
// // //                               ),
// // //                               SizedBox(height: 9 * fem),
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(
// // //                                     0 * fem, 0 * fem, 106 * fem, 0 * fem),
// // //                                 child: Text(
// // //                                   'Dashboard',
// // //                                   style: SafeGoogleFont(
// // //                                     'Kanit',
// // //                                     fontSize: 20 * ffem,
// // //                                     fontWeight: FontWeight.w400,
// // //                                     height: 1.495 * ffem / fem,
// // //                                     color: Color(0xffffffff),
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 9 * fem),
// // //                     InkWell(
// // //                       onTap: () {
// // //                         setState(() {
// // //                           _selectedMenu = 'cycle';
// // //                           if (_selectedMenu == 'cycle') {
// // //                             Navigator.pushReplacement(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (context) => CycleMenuPage(),
// // //                               ),
// // //                             );
// // //                           }
// // //                         });
// // //                       },
// // //                       child: Container(
// // //                         padding: EdgeInsets.fromLTRB(
// // //                             14 * fem, 9 * fem, 121 * fem, 9 * fem),
// // //                         width: double.infinity,
// // //                         decoration: BoxDecoration(
// // //                           border: Border.all(color: Color(0xff717171)),
// // //                           color: _selectedMenu == 'cycle'
// // //                               ? Colors.orange
// // //                               : Color(0xff323131),
// // //                         ),
// // //                         child: FittedBox(
// // //                           fit: BoxFit.scaleDown,
// // //                           child: Row(
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(
// // //                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
// // //                                 width: 16 * fem,
// // //                                 height: 20 * fem,
// // //                                 child: Image.asset(
// // //                                   'assets/images/cycleicon.png',
// // //                                   width: 16 * fem,
// // //                                   height: 20 * fem,
// // //                                 ),
// // //                               ),
// // //                               Text(
// // //                                 'Cycle',
// // //                                 style: SafeGoogleFont(
// // //                                   'Kanit',
// // //                                   fontSize: 20 * ffem,
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 1.495 * ffem / fem,
// // //                                   color: Color(0xffffffff),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 9 * fem),
// // //                     InkWell(
// // //                       onTap: () {
// // //                         setState(() {
// // //                           _selectedMenu = 'report';
// // //                           if (_selectedMenu == 'report') {
// // //                             Navigator.pushReplacement(
// // //                               context,
// // //                               MaterialPageRoute(
// // //                                 builder: (context) => ReportPage(),
// // //                               ),
// // //                             );
// // //                           }
// // //                         });
// // //                       },
// // //                       child: Container(
// // //                         padding: EdgeInsets.fromLTRB(
// // //                             14 * fem, 9 * fem, 109 * fem, 9 * fem),
// // //                         width: double.infinity,
// // //                         decoration: BoxDecoration(
// // //                           border: Border.all(color: Color(0xff717171)),
// // //                           color: _selectedMenu == 'report'
// // //                               ? Colors.orange
// // //                               : Color(0xff323131),
// // //                         ),
// // //                         child: FittedBox(
// // //                           fit: BoxFit.scaleDown,
// // //                           child: Row(
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Container(
// // //                                 margin: EdgeInsets.fromLTRB(
// // //                                     0 * fem, 0 * fem, 16 * fem, 0 * fem),
// // //                                 width: 16 * fem,
// // //                                 height: 20 * fem,
// // //                                 child: Image.asset(
// // //                                   'assets/images/reporticon.png',
// // //                                   width: 16 * fem,
// // //                                   height: 20 * fem,
// // //                                 ),
// // //                               ),
// // //                               Text(
// // //                                 'Report',
// // //                                 style: SafeGoogleFont(
// // //                                   'Kanit',
// // //                                   fontSize: 20 * ffem,
// // //                                   fontWeight: FontWeight.w400,
// // //                                   height: 1.495 * ffem / fem,
// // //                                   color: Color(0xffffffff),
// // //                                 ),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),//
// // //     );
// // //   }
// // // }
