import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

class menuHarian extends StatefulWidget {
  const menuHarian({Key? key}) : super(key: key);

  @override
  State<menuHarian> createState() => _menuHarianState();
}

class _menuHarianState extends State<menuHarian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Yang Selesai Hari ini'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: dataTransaksi.getDataJadi(),
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
                          subtitle: Text('jumlah: ${doc['Jumlah']}'),
                          onTap: () {},
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