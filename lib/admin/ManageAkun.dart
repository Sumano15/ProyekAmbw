// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:ambwproyek/admin/dataAkunService.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'detailAkun.dart';

class ManageAkunPage extends StatefulWidget {
  const ManageAkunPage({Key? key}) : super(key: key);

  @override
  State<ManageAkunPage> createState() => _ManageAkunPageState();
}

class _ManageAkunPageState extends State<ManageAkunPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list Akun',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF0BB62),
          title: Text('List Akun',
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
                  stream: manageDataAkun.getData(),
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
                            title: Text(doc['Nama'].toString()),
                            subtitle: Text(doc.id),
                            leading: Text(doc['role'].toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detailAkunPage(
                                    nama: doc['Nama'].toString(),
                                    noTelp: doc['No Telp'].toString(),
                                    email: doc['email'].toString(),
                                    password: doc['password'].toString(),
                                    role: doc['role'].toString(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
