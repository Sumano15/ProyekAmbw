// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/menuService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../dataclass.dart';

// class DetailPembayarand extends StatelessWidget {
//   //const DetailPembayarand({Key? key}) : super(key: key);
//   final menu dtMenu;
//   final int jumlahQTY;
//   const DetailPembayarand({
//     Key? key,
//     required this.dtMenu, required this.jumlahQTY
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Text('hehe'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class DetailPembayarand extends StatefulWidget {
  const DetailPembayarand({Key? key}) : super(key: key);
  // final transaksiMenu transaksimenuList;
  // const DetailPembayarand({Key? key, required this.transaksimenuList})
  //     : super(key: key);

  @override
  State<DetailPembayarand> createState() => _DetailPembayarandState();
}

class _DetailPembayarandState extends State<DetailPembayarand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseTransaksi.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return ListTile(
                          title: Text(doc['Nama']),
                          subtitle:
                              Text(doc['Harga']),
                          trailing: Wrap(
                            spacing: 10,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      //qty += 1;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                              Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(doc['Jumlah'])),
                              IconButton(
                                  onPressed: () {
                                    //if (qty > 1) qty -= 1;
                                  },
                                  icon: Icon(Icons.add)),
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
            ),
          ),
        ],
      ),
    );
  }
}
