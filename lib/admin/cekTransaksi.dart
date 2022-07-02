// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/admin/detailPesananAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

import 'menuBelumSelesai.dart';

class CekTransaksi extends StatelessWidget {
  const CekTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list Transaksi',
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: dataTransaksi.getData(),
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
                            title: Text(doc.id),
                            subtitle: Text(doc['Tanggal'].toString()),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detailPesananAdmin(
                                    idPesanan: doc.id,
                                    noMeja: doc['NoMeja'].toString(),
                                    Status: doc['Status'].toString(),
                                    tanggal: doc['Tanggal'].toString(),
                                    Uid: doc['UID'].toString(),
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
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => MenuBelumSelesaiPage()),
              //       );
              //     },
              //     child: Text("Pesanan Belum Selesai")),
            ],
          ),
        ),
      ),
    );
  }
}
