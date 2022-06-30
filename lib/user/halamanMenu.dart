// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambwproyek/signInServices.dart';
import 'package:ambwproyek/user/halamanTransaksi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../dataclass.dart';
import '../menuService.dart';
import 'detailMenu.dart';

class halamanMenu extends StatefulWidget {
  final String rndmid;
  final String noMeja;
  const halamanMenu({Key? key, required this.rndmid, required this.noMeja})
      : super(key: key);

  @override
  State<halamanMenu> createState() => _halamanMenuState();
}

class _halamanMenuState extends State<halamanMenu> {
  Future<int?> cekIsi(String namaMenu) async {
    CollectionReference tblTransaksi =
        FirebaseFirestore.instance.collection('transaksiMenu');
    QuerySnapshot snapshot =
        await tblTransaksi.doc(widget.rndmid).collection('menu').get();
    final allData = snapshot.docs.map((doc) => doc.id).toList();
    for (int i = 0; i < allData.length; i++) {
      if (allData[i] == namaMenu) {
        final ref = tblTransaksi
            .doc(widget.rndmid)
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text(
            'No Meja / Kode Transaksi : ${widget.noMeja} / ${widget.rndmid}',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromRGBO(244, 238, 169, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("<- ",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Makanan",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.rice_bowl, size: 26, color: Colors.black),
                Text(" ->",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseMakanan.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return ListTile(
                          title: Text(doc['Nama']),
                          subtitle: Text(doc['Harga']),
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
                            var qty = await cekIsi(doc['Nama']);
                            qty ??= 0;
                            print(qty);
                            final menu dtMenu = menu(
                              gambar: doc['Gambar'],
                              harga: doc['Harga'],
                              nama: doc['Nama'],
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailMenu(
                                  rndmId: widget.rndmid,
                                  dtmenu: dtMenu,
                                  jmlh: int.parse(qty.toString()),
                                  noMeja: widget.noMeja,
                                ),
                              ),
                            );
                          },
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
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromRGBO(244, 238, 169, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("<- ",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Minuman",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.coffee, size: 26, color: Colors.black),
                Text(" ->",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: DatabaseMinuman.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(doc['Nama']),
                        subtitle: Text(doc['Harga']),
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
                          var qty = await cekIsi(doc['Nama']);
                          qty ??= 0;
                          print(qty);
                          final menu dtMenu = menu(
                            gambar: doc['Gambar'],
                            harga: doc['Harga'],
                            nama: doc['Nama'],
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailMenu(
                                rndmId: widget.rndmid,
                                dtmenu: dtMenu,
                                jmlh: int.parse(qty.toString()),
                                noMeja: widget.noMeja,
                              ),
                            ),
                          );
                        },
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF0BB62),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => halamanTransaksi(
                rndmId: widget.rndmid,
                noMeja: widget.noMeja,
              ),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
    );
  }
}
