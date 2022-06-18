// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  String qrCode = "nomeja";
  @override
  Widget build(BuildContext context) {
    final noMejaController = TextEditingController();
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: QrImage(
              data: qrCode,
              size: 300,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: noMejaController,
            decoration: InputDecoration(
              labelText: "No Meja",
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(240, 188, 98, 1),
              fixedSize: const Size(200, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              if (noMejaController.text.toString().isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("No Meja tidak boleh kosong"),
                      actions: [
                        FlatButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                setState(() {
                  qrCode = noMejaController.text.toString();
                  print(qrCode);
                });
              }
            },
            child: Text(
              "Generate Qr Code",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
