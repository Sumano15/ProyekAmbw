// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/menuService.dart';
import 'package:ambwproyek/user/detailMenu1.dart';
import 'package:ambwproyek/user/halamanMenu.dart';
import 'package:ambwproyek/user/pembayaran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../dataclass.dart';
import 'detailMenu.dart';

class Transaksi {
  int? total;

  Transaksi({this.total});

  int getTotal() {
    return total ?? 0;
  }

  void setTotal(int total) {
    this.total = total;
  }
}

class halamanTransaksi extends StatefulWidget {
  final String uid;
  final String rndmId;
  final String noMeja;
  const halamanTransaksi(
      {Key? key, required this.rndmId, required this.noMeja, required this.uid})
      : super(key: key);

  @override
  State<halamanTransaksi> createState() => _halamanTransaksiState();
}

class _halamanTransaksiState extends State<halamanTransaksi> {
  int jumlah = 0;
  int subTotal = 0;
  Transaksi _transaksi = Transaksi();
  Future<int?> cekIsi(String namaMenu) async {
    CollectionReference tblTransaksi =
        FirebaseFirestore.instance.collection('transaksiMenu');
    QuerySnapshot snapshot =
        await tblTransaksi.doc(widget.rndmId).collection('menu').get();
    final allData = snapshot.docs.map((doc) => doc.id).toList();
    for (int i = 0; i < allData.length; i++) {
      if (allData[i] == namaMenu) {
        final ref = tblTransaksi
            .doc(widget.rndmId)
            .collection('menu')
            .doc(namaMenu)
            .withConverter(
              fromFirestore: detData.fromFirestore,
              toFirestore: (detData ddata, _) => ddata.ToFirestore(),
            );
        final docSnap = await ref.get();
        final ddata = docSnap.data(); // Convert to City object
        if (ddata != null) {
          return ddata.Jumlah;
        } else {
          return 0;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text(
            'No Meja/ Kode Transaksi : ${widget.noMeja} / ${widget.rndmId}',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: DatabaseTransaksi.getDataMenu(widget.rndmId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        int jmlh = doc['Jumlah'];
                        int Harga = doc['Harga'];
                        int tmp = jmlh * Harga;
                        subTotal = tmp;
                        jumlah = jumlah + tmp;
                        _transaksi.setTotal(jumlah);
                        return Container(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(doc.id),
                                subtitle: Text(doc['Harga'].toString()),
                                trailing: Wrap(
                                  spacing: 10,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Text(jmlh.toString())),
                                  ],
                                ),
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 100,
                                    minHeight: 100,
                                    maxWidth: 200,
                                    maxHeight: 200,
                                  ),
                                  child: Image.network(
                                    doc['Gambar'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () async {
                                  var qty = await cekIsi(doc.id);
                                  qty ??= 0;
                                  print(qty);
                                  final menu dtMenu = menu(
                                    gambar: doc['Gambar'],
                                    harga: doc['Harga'].toString(),
                                    nama: doc.id,
                                  );
                                  print('aa ${qty}');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => detailMenu1(
                                        rndmId: widget.rndmId,
                                        dtmenu: dtMenu,
                                        jmlh: int.parse(qty.toString()),
                                        noMeja: widget.noMeja,
                                        uid: widget.uid,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('= ${subTotal.toString()}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffff8906),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pembayaran(
                                  total: _transaksi.getTotal().toString(),
                                  idPesanan: widget.rndmId,
                                )),
                      );
                    },
                    label: Text('Detail Pembayaran'),
                    icon: Icon(
                      Icons.payment,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 55,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF0BB62),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => halamanMenu(
                            rndmid: widget.rndmId,
                            noMeja: widget.noMeja,
                            uId: widget.uid,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.menu_book_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
