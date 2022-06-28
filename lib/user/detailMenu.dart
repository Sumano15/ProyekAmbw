// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/menuService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_pembayaran2.dart';

// class DetailMenu extends StatelessWidget {
//   final menu dtMenu;
//   const DetailMenu({
//     Key? key,
//     required this.dtMenu,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Detail Menu',
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         backgroundColor: Color(0xFFF0BB62),
//         elevation: 20,
//         //title: const Text('GoogleNavBar'),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CircleAvatar(
//                     radius: 100,
//                     backgroundImage: NetworkImage(dtMenu.gambar),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(dtMenu.nama,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text('Rp  ${dtMenu.harga}',
//                       style: TextStyle(
//                           fontSize: 20,
//                           //fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                         },
//                         child: Icon(Icons.remove, color: Colors.white),
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(8),
//                           primary: Color(0xFFF0BB62), // Button color
//                           onPrimary: Colors.red, // Splash color
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text('0',
//                           style: TextStyle(
//                               fontSize: 20,
//                               //fontWeight: FontWeight.bold,
//                               color: Colors.black)),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {

//                         },
//                         child: Icon(Icons.add, color: Colors.white),
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           padding: EdgeInsets.all(8),
//                           primary: Color(0xFFF0BB62), // Button color
//                           onPrimary: Colors.red, // Splash color
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DetailMenu extends StatefulWidget {
  final menu dtMenu;
  const DetailMenu({
    Key? key,
    required this.dtMenu,
  }) : super(key: key);

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  late transaksiMenu transaksimenuList;

  int _qty = 1;

  void add() {
    setState(() {
      _qty += 1;
    });
  }

  void remove() {
    setState(() {
      if (_qty > 1) _qty -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Menu',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFF0BB62),
        elevation: 20,
        //title: const Text('GoogleNavBar'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(widget.dtMenu.gambar),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.dtMenu.nama,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Rp  ${widget.dtMenu.harga}',
                      style: TextStyle(
                          fontSize: 20,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          remove();
                        },
                        child: Icon(Icons.remove, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                          primary: Color(0xFFF0BB62), // Button color
                          onPrimary: Colors.red, // Splash color
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${_qty}',
                          style: TextStyle(
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          add();
                        },
                        child: Icon(Icons.add, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(8),
                          primary: Color(0xFFF0BB62), // Button color
                          onPrimary: Colors.red, // Splash color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final dtTransaksi = transaksiMenu(
                        namaMenu: transaksimenuList.namaMenu.toList(),
                        harga: transaksimenuList.harga.toList(),
                        gambar: transaksimenuList.gambar.toList(), 
                        jumlah: transaksimenuList.jumlah.toList(), 
                        status_makanan: transaksimenuList.status_makanan.toList(),
                        noMeja: transaksimenuList.noMeja.toString(), 
                        noTransaksi: transaksimenuList.noTransaksi.toString(), 
                        status_transaksi: transaksimenuList.status_transaksi.toString(), 
                        Uid: transaksimenuList.Uid.toString());
                      // transaksimenuList.gambar.add(widget.dtMenu.gambar);
                      // transaksimenuList.namaMenu.add(widget.dtMenu.nama);
                      // transaksimenuList.harga
                      //     .add(int.parse(widget.dtMenu.harga));
                      // transaksimenuList.jumlah.add(_qty);
                      // transaksimenuList.Uid = '445';
                      // transaksimenuList.noMeja = '12';
                      // transaksimenuList.noTransaksi = '2';
                      // transaksimenuList.status_transaksi = 'belum selesai';
                      // transaksimenuList.status_makanan.add(false);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPembayarand(
                                  transaksimenuList: dtTransaksi,
                                )),
                      );
                      DatabaseTransaksi.addData(data_transaksi: dtTransaksi);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      primary: Color(0xFFF0BB62), // Button color
                      onPrimary: Colors.red, // Splash color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
