import 'package:ambwproyek/dapur/statusChanger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

import 'home.dart';

class totalMenu extends StatefulWidget {
  final String idPesanan;
  final String Uid;
  final String tanggal;
  final String noMeja;
  final String Status;
  const totalMenu(
      {Key? key,
      required this.idPesanan,
      required this.Uid,
      required this.tanggal,
      required this.noMeja,
      required this.Status})
      : super(key: key);

  @override
  State<totalMenu> createState() => _totalMenuState();
}

class _totalMenuState extends State<totalMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text('Total Pesanan Hari Ini',
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
                  Text('Tanggal :',
                      style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(' : ${widget.tanggal}',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
            ],
          ),
          
          SizedBox(
            height: 20,
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
      bottomNavigationBar: Material(
        color: const Color(0xFFF0BB62),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DapurHome()),
            );
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}