// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:ambwproyek/menuService.dart';
import 'package:ambwproyek/user/halamanMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class inputNoMeja extends StatefulWidget {
  final String uid;
  const inputNoMeja({Key? key, required this.uid}) : super(key: key);

  @override
  State<inputNoMeja> createState() => _inputNoMejaState();
}

class _inputNoMejaState extends State<inputNoMeja> {
  final _noMejaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text('Input No Meja',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "asset/images/input.png",
              fit: BoxFit.fitWidth,
              width: 200,
              height: 200,
              color: Colors.black,
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  TextField(
                    controller: _noMejaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input No Meja',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: Icon(Icons.input),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(240, 188, 98, 1),
                      fixedSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      const characters =
                          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                      Random random = Random();
                      String rndm = String.fromCharCodes(Iterable.generate(
                          4,
                          (_) => characters
                              .codeUnitAt(random.nextInt(characters.length))));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => halamanMenu(
                            rndmid: rndm,
                            noMeja: _noMejaController.text,
                          ),
                        ),
                      );
                      DatabaseTransaksi.addDocument(
                          docId: rndm,
                          noMeja: _noMejaController.text,
                          uid: widget.uid);
                    },
                  ),
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}
