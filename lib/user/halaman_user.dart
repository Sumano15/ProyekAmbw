// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ambwproyek/user/detail_pembayaran2.dart';
import 'package:ambwproyek/user/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Halmenu.dart';

class Halaman_user extends StatefulWidget {
  const Halaman_user({Key? key}) : super(key: key);

  @override
  State<Halaman_user> createState() => _Halaman_userState();
}

class _Halaman_userState extends State<Halaman_user> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _Page = [
    Halmenu(),
    //DetailPembayarand(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'No Meja / No Transaksi : 5 / A123 ',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFF0BB62),
        elevation: 20,
        //title: const Text('GoogleNavBar'),
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
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
                GButton(icon: Icons.menu_book, text: 'Lihat Menu'),
                GButton(icon: Icons.attach_money, text: 'Detail Pembayaran'),
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
