// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HalTerimaKasih extends StatefulWidget {
  const HalTerimaKasih({Key? key}) : super(key: key);

  @override
  State<HalTerimaKasih> createState() => _HalTerimaKasihState();
}

class _HalTerimaKasihState extends State<HalTerimaKasih> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text('Terima Kasih telah menggunakan aplikasi ini!', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),),
            )
            
          ],
        ),
      ),
    );
  }
}