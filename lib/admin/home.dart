import 'package:ambwproyek/admin/ManageAkun.dart';
import 'package:ambwproyek/admin/buatMenu.dart';
import 'package:ambwproyek/admin/cekTransaksi.dart';
import 'package:ambwproyek/admin/liatMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _Page = [
    CekTransaksi(),
    ManageAkunPage(),
    BuatMenu(),
    LiatMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
      body: _Page[_selectedIndex],
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
                GButton(icon: Icons.person, text: 'List Akun'),
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
