import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../dataclass.dart';
import '../menuService.dart';

class detailMenu extends StatefulWidget {
  final String rndmId;
  final menu dtmenu;
  final int jmlh;
  const detailMenu(
      {Key? key,
      required this.rndmId,
      required this.dtmenu,
      required this.jmlh})
      : super(key: key);

  @override
  State<detailMenu> createState() => _detailMenuState();
}

class _detailMenuState extends State<detailMenu> {
  int _qty = 0;

  @override
  void initState() {
    if (widget.jmlh != null) {
      _qty = widget.jmlh;
    } else {
      _qty = 0;
    }
    super.initState();
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
                    backgroundImage: NetworkImage(widget.dtmenu.gambar),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.dtmenu.nama,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Rp  ${widget.dtmenu.harga}',
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
                          setState(() {
                            if (_qty > 0) {
                              _qty--;
                            }
                          });
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
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _qty++;
                          });
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
                      if (_qty <= 0) {
                        SnackBar(
                          content: Text('Pilih jumlah menu terlebih dahulu'),
                          backgroundColor: Colors.red,
                        );
                      } else {
                        DatabaseTransaksi.addMenu(
                            NamaMenu: widget.dtmenu.nama,
                            Harga: int.parse(widget.dtmenu.harga),
                            Jumlah: _qty,
                            RandId: widget.rndmId,
                            gambar: widget.dtmenu.gambar);
                      }
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
