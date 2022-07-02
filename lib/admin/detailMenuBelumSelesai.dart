import 'package:ambwproyek/dapur/dapurservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detailPesananAdmin.dart';

class detailMenuBelumSelesaiPage extends StatefulWidget {
  final String idPesanan;
  final String Uid;
  final String tanggal;
  final String noMeja;
  final String Status;
  const detailMenuBelumSelesaiPage(
      {Key? key,
      required this.idPesanan,
      required this.Uid,
      required this.tanggal,
      required this.noMeja,
      required this.Status})
      : super(key: key);

  @override
  State<detailMenuBelumSelesaiPage> createState() => _detailMenuBelumSelesaiPageState();
}

class _detailMenuBelumSelesaiPageState extends State<detailMenuBelumSelesaiPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list Menu DiProses',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0BB62),
          title: Text('List Pesanan',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<QuerySnapshot>(
                  future: dataTransaksi.getDataMenu(widget.idPesanan),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData || snapshot.data != null) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];
                            return Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(doc.id),
                                    subtitle: Text(doc['Harga'].toString()),
                                    trailing: Text(doc['Status'].toString()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}