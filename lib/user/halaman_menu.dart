// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ambwproyek/user/catProduk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4EEA9),
              ),
              child: Column(
                children: [
                  Text(
                    'Makanan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CatProduk(),
            //SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF4EEA9),
              ),
              child: Column(
                children: [
                  Text(
                    'Minuman',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CatProdukMinuman(),
            //Detail_pembayaran(),
            // ElevatedButton(onPressed: () {
            //   Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Detail_pembayaran()),
            //       );
            // } , child: Text('Detail Pembayaran')),
          ],
        ),
      ),
    );
  }
}
