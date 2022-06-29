// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements

import 'dart:math';

import 'package:ambwproyek/user/halaman_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uuid/uuid.dart';

import '../dataclass.dart';
import '../menuService.dart';

// class UserHome extends StatefulWidget {
//   const UserHome({Key? key}) : super(key: key);

//   @override
//   State<UserHome> createState() => _UserHomeState();
// }
// //pasing uid sama no meja

// class _UserHomeState extends State<UserHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFF0BB62),
//         title: Text(
//           "Scan QR Code",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(50),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Image.asset(
//               "asset/images/qrcode.png",
//               width: 240,
//               height: 240,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Color.fromRGBO(240, 188, 98, 1),
//                       fixedSize: const Size(200, 65),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Halaman_user()),
//                       );
//                     },
//                     child: Row(
//                       children: [
//                         Text(
//                           "Click to Scan!",
//                           style: TextStyle(
//                             fontSize: 21,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Icon(
//                           Icons.photo_camera,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Text(
//                     "Tekan tombol diatas",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "untuk Melakukan Pemesanan!",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class UserHome extends StatefulWidget {
  final String passUID;
  const UserHome({Key? key, required this.passUID}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}
//pasing uid sama no meja

class _UserHomeState extends State<UserHome> {
  late transaksiMenu transaksimenuList;

  final _noMejaController = TextEditingController();

  String getRandomString(int length) {
    const characters =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text(
          "Halaman Awal",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              "asset/images/qrcode.png",
              width: 240,
              height: 240,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _noMejaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: 'Input No Meja',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(240, 188, 98, 1),
                      fixedSize: const Size(200, 65),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Halaman_user()),
                      // );
                      const characters =
                          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                      Random random = Random();
                      String rndm = String.fromCharCodes(Iterable.generate(
                          4,
                          (_) => characters
                              .codeUnitAt(random.nextInt(characters.length))));
                      final dtTransaksi = transaksiMenu(
                          namaMenu: [''],
                          harga: [0],
                          gambar: [''],
                          jumlah: [0],
                          status_makanan: [false],
                          noMeja: _noMejaController.text.toString(),
                          status_transaksi: 'belum bayar',
                          Uid: widget.passUID);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Halaman_user(
                            rndmID: rndm,
                          ),
                        ),
                      );
                      DatabaseTransaksi.addData(
                          data_transaksi: dtTransaksi, docId: rndm);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Click to Scan!",
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Tekan tombol diatas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "untuk Melakukan Pemesanan!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
