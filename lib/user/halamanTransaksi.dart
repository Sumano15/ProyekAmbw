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
  final String rndmId;
  final String noMeja;
  const halamanTransaksi({Key? key, required this.rndmId, required this.noMeja})
      : super(key: key);

  @override
  State<halamanTransaksi> createState() => _halamanTransaksiState();
}

class _halamanTransaksiState extends State<halamanTransaksi> {
  int jumlah = 0;
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
        title: Text(
            'No Meja/ Kode Transaksi : ${widget.noMeja} / ${widget.rndmId}'),
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
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
                        jumlah = jumlah + tmp;
                        _transaksi.setTotal(jumlah);
                        return ListTile(
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
                            // print('aa ${qty}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailMenu1(
                                  rndmId: widget.rndmId,
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  halamanMenu(rndmid: widget.rndmId, noMeja: widget.noMeja),
            ),
          );
        },
        child: const Icon(Icons.menu_book_rounded),
      ),
      bottomNavigationBar: Material(
        color: const Color(0xffff8906),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      pembayaran(total: _transaksi.getTotal().toString())),
            );

            //print('called on tap');
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Purchase',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
