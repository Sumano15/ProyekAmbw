// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ambwproyek/user/catProduk.dart';
import 'package:ambwproyek/user/detail_pembayaran.dart';
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
            Text('thh'),
            CatProduk(),
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