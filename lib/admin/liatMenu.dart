// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ambwproyek/admin/buatMenu.dart';
import 'package:ambwproyek/admin/editData.dart';
import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/menuService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: prefer_const_constructors

class LiatMenu extends StatefulWidget {
  const LiatMenu({Key? key}) : super(key: key);

  @override
  State<LiatMenu> createState() => _LiatMenuState();
}

class _LiatMenuState extends State<LiatMenu> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'MENU',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF0BB62),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xFFF4EEA9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  controller: tabController,
                  isScrollable: true,
                  //labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  labelPadding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  tabs: [
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.rice_bowl, color: Colors.black)),
                    ),
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.coffee, color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  StreamBuilder<QuerySnapshot>(
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
                              onTap: () {
                                final dt = menu(
                                    nama: doc['Nama'],
                                    harga: doc['Harga'],
                                    gambar: doc['Gambar']);
                                String id = doc.id;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditData(
                                            detData: dt,
                                            kategori: "makanan",
                                            id: id,
                                          )),
                                );
                              },
                              onLongPress: () {
                                String idmenu = doc.id;
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                        "Are You Sure Want To Delete This Data?"),
                                    content: Text("click ok to continue"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          DatabaseMakanan.deleteData(
                                              id: idmenu);
                                          Navigator.pop(ctx);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '${doc['Nama']} deleted')));
                                        },
                                        child: Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
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
                                final dt = menu(
                                    nama: doc['Nama'],
                                    harga: doc['Harga'],
                                    gambar: doc['Gambar']);
                                String id = doc.id;
                                print(id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditData(
                                            detData: dt,
                                            kategori: "minuman",
                                            id: id,
                                          )),
                                );
                              },
                              onLongPress: () {
                                String idmenu = doc.id;
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                        "Are You Sure Want To Delete This Data?"),
                                    content: Text("click ok to continue"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          DatabaseMinuman.deleteData(
                                              id: idmenu);
                                          Navigator.pop(ctx);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '${doc['Nama']} deleted')));
                                        },
                                        child: Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
