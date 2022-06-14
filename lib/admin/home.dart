// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class AdminHome extends StatefulWidget {
//   const AdminHome({Key? key}) : super(key: key);

//   @override
//   State<AdminHome> createState() => _AdminHomeState();
// }

// class _AdminHomeState extends State<AdminHome> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Likes',
//       style: optionStyle,
//     ),
//     Text(
//       'Search',
//       style: optionStyle,
//     ),
//     Text(
//       'Profile',
//       style: optionStyle,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Admin'),
//         ),
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: Container(
//           child: Scaffold(
//             bottomNavigationBar: Container(
//               color: Color(0xfff0bb62),
//               child: SafeArea(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   child: GNav(
//                     backgroundColor: Color(0xFFF0BB62),
//                     gap: 20,
//                     tabBackgroundColor: Color(0xFFF4EEA9),
//                     padding: EdgeInsets.all(16),
//                     tabs: const [
//                       GButton(icon: Icons.note, text: 'Cek Transaksi'),
//                       GButton(icon: Icons.qr_code, text: 'Buat Qr Code'),
//                       GButton(icon: Icons.edit, text: 'Buat Menu'),
//                       GButton(icon: Icons.menu_book, text: 'Lihat Menu'),
//                     ],
//                     selectedIndex: _selectedIndex,
//                     onTabChange: (index) {
//                       setState(() {
//                         _selectedIndex = index;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF0BB62),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Color(0xFFF4EEA9),
              hoverColor: Color(0xFFF4EEA9),
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color(0xFFF4EEA9),
              color: Colors.black,
              tabs: [
                GButton(icon: Icons.note, text: 'Cek Transaksi'),
                GButton(icon: Icons.qr_code, text: 'Buat Qr Code'),
                GButton(icon: Icons.edit, text: 'Buat Menu'),
                GButton(icon: Icons.menu_book, text: 'Lihat Menu'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
