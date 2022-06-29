// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/menuService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_pembayaran2.dart';

class DetailMenu extends StatefulWidget {
  final String rndmID;
  final String docID;
  final menu dtMenu;
  const DetailMenu(
      {Key? key,
      required this.rndmID,
      required this.dtMenu,
      required this.docID})
      : super(key: key);

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
                      DatabaseTransaksi.updateData(
                          nama: widget.dtMenu.nama,
                          harga: int.parse(widget.dtMenu.harga),
                          gambar: widget.dtMenu.gambar,
                          jumlah: _qty,
                          statusMakanan: false,
                          id: widget.rndmID);
                      // if(DatabaseTransaksi.getData().Nama) {

                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPembayarand(
                                  rndmID: widget.rndmID,
                                )),
                      );
                      //DatabaseTransaksi.updateData(data_transaksi: dtTransaksi, id: );
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
