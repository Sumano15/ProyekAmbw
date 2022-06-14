// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}


class _MenuState extends State<Menu> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text('MENU'),
          SizedBox(
            height: 20,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF0BB62),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Color(0xFFF4EEA9),
                  borderRadius: BorderRadius.circular(15),
                ),
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 90),
                tabs: [
                  Tab(
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.rice_bowl, color: Colors.black)),
                  ),
                  Tab(
                    child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.coffee, color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(child: TabBarView(
          //   controller: tabController,
          //   children: [
          //     ListView.builder(
          //       physics: BouncingScrollPhysics(),
          //       shrinkWrap: true,
          //       itemCount: 4,
          //       itemBuilder: (context, index) {
          //         return Card(
          //           margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          //           child: ListTile(

          //           ),
          //         );
          //       }
          //       )
          //   ],
          // )),
        ],
      ),
    );
  }
}



// return MaterialApp(
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xFFF0BB62),
//             //elevation: 0,
//             bottom: TabBar(
//               unselectedLabelColor: Color(0xFFF4EEA9),
//               indicatorSize: TabBarIndicatorSize.label,
//               indicatorColor: Color(0xFFF4EEA9),
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10)),
//                 color: Color(0xFFF4EEA9),
//               ),
//               tabs: [
//                 Tab(
//                   child: Align(
//                       alignment: Alignment.center,
//                       child: Icon(Icons.rice_bowl, color: Colors.black)),
//                 ),
//                 Tab(
//                   child: Align(
//                       alignment: Alignment.center,
//                       child: Icon(Icons.coffee, color: Colors.black)),
//                 ),
//                 //Tab(icon: Icon(Icons.rice_bowl, color: Colors.black)),
//               ],
//             ),
//             title: Text(
//               "Menu",
//               style: TextStyle(color: Colors.black),
//             ),
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(),
//           bottomNavigationBar: Container(
//             decoration: BoxDecoration(
//               color: Color(0xFFF0BB62),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 20,
//                   color: Colors.black.withOpacity(.1),
//                 )
//               ],
//             ),
//             child: SafeArea(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
//                 child: GNav(
//                   rippleColor: Color(0xFFF4EEA9),
//                   hoverColor: Color(0xFFF4EEA9),
//                   gap: 8,
//                   activeColor: Colors.black,
//                   iconSize: 24,
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                   duration: Duration(milliseconds: 400),
//                   tabBackgroundColor: Color(0xFFF4EEA9),
//                   color: Colors.black,
//                   tabs: [
//                     GButton(icon: Icons.menu_book, text: 'Lihat Menu'),
//                     GButton(
//                         icon: Icons.attach_money, text: 'Detail Pembayaran'),
//                   ],
//                   selectedIndex: _selectedIndex,
//                   onTabChange: (index) {
//                     setState(() {
//                       _selectedIndex = index;
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );