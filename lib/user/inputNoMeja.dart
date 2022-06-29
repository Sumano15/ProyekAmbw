import 'dart:math';

import 'package:ambwproyek/menuService.dart';
import 'package:ambwproyek/user/halamanMenu.dart';
import 'package:flutter/material.dart';
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
        title: Text('Input No Meja'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _noMejaController,
              decoration: InputDecoration(
                labelText: 'No Meja',
              ),
            ),
            ElevatedButton(
              child: Text('Submit'),
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
                      uid: widget.uid,
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
    );
  }
}
