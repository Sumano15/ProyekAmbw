// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

class detailPesananAdmin extends StatefulWidget {
  final String idPesanan;
  final String Uid;
  final String tanggal;
  final String noMeja;
  final String Status;
  const detailPesananAdmin(
      {Key? key,
      required this.idPesanan,
      required this.Uid,
      required this.tanggal,
      required this.noMeja,
      required this.Status})
      : super(key: key);

  @override
  State<detailPesananAdmin> createState() => _detailPesananAdminState();
}

class _detailPesananAdminState extends State<detailPesananAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text('Detail Pesanan  < ${widget.idPesanan} >',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.numbers,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Kode Pesanan : ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text('${widget.idPesanan}',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.date_range, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('Tanggal : ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text(' ${widget.tanggal}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.table_restaurant, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('No Meja : ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('${widget.noMeja}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.start, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('Status : ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('${widget.Status}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.person, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('id Pembeli : ',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('${widget.Uid}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
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
