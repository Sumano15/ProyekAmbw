// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class pembayaran extends StatefulWidget {
  final String total;
  const pembayaran({Key? key, required this.total}) : super(key: key);

  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text(
            'Detail Pembayaran',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Pilih Metode Pembayaran'),
          ],
        ),
      ),
    );
  }
}

//Text('lakukan pembayaran sejumlah ${widget.total}')
