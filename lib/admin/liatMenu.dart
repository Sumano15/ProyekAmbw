import 'package:ambwproyek/menuService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              height: 30,
            ),
            Text(
              'MENU',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
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
            SizedBox(
              height: 20,
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
                              title: Text(doc['nama']),
                              subtitle: Text(doc['harga']),
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 100,
                                  minHeight: 100,
                                  maxWidth: 200,
                                  maxHeight: 200,
                                ),
                                child: Image.network(
                                  doc['gambar'],
                                  fit: BoxFit.cover,
                                ),
                              ),
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
