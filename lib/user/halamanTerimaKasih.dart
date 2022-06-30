// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

class HalTerimaKasih extends StatefulWidget {
  final String idPesanan;
  const HalTerimaKasih({Key? key, required this.idPesanan}) : super(key: key);

  @override
  State<HalTerimaKasih> createState() => _HalTerimaKasihState();
}

class _HalTerimaKasihState extends State<HalTerimaKasih> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              'Terima Kasih telah melakukan pembayaran',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text('Pesanan Anda:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
    );
  }
}
