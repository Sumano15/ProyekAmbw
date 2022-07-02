import 'package:ambwproyek/admin/detailMenuBelumSelesai.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detailPesananAdmin.dart';

class MenuBelumSelesaiPage extends StatefulWidget {
  const MenuBelumSelesaiPage({Key? key}) : super(key: key);

  @override
  State<MenuBelumSelesaiPage> createState() => _MenuBelumSelesaiPageState();
}

class _MenuBelumSelesaiPageState extends State<MenuBelumSelesaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                builder: (context) => detailMenuBelumSelesaiPage(
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
            )
          ],
        ),
      ),
    );
  }
}