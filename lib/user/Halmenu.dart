import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/user/detailPembayaran.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../menuService.dart';

class Halmenu extends StatefulWidget {
  const Halmenu({Key? key}) : super(key: key);

  @override
  State<Halmenu> createState() => _HalmenuState();
}

class _HalmenuState extends State<Halmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Makanan",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Container(
            child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseMakanan.getData(),
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
                            title: Text(doc['Nama']),
                            subtitle: Text(doc['Harga']),
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
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {},
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: Text("0")),
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {},
                                ),
                              ],
                            ));
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
          SizedBox(
            height: 20,
          ),
          Text("Minuman",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: DatabaseMinuman.getData(),
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
                        title: Text(doc['Nama']),
                        subtitle: Text(doc['Harga']),
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
                        onTap: () {
                          final menu dt = menu(
                              gambar: doc['Gambar'],
                              nama: doc['Nama'],
                              harga: doc['Harga']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMenu(dtMenu: dt),
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
        ],
      ),
    );
  }
}
