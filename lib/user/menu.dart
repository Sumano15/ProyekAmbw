// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../admin/editData.dart';
import '../dataclass.dart';
import '../menuService.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  int _itemCount = 0;
  int jumMenu = 0;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 1, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'MENU',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFF4EEA9),
            ),
            child: Column(
              children: [
                Text(
                  'No Meja / No Transaksi : 5 / A123 ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Text("makanan"),
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(
                                      () {
                                        _itemCount--;
                                      },
                                    );
                                  },
                                ),
                                Text(_itemCount.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(
                                      () {
                                        _itemCount++;
                                      },
                                    );
                                  },
                                )
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(
//               child: TabBarView(
//             controller: tabController,
//             children: [
//               //Listview makanan
//               ListView.builder(
//                   physics: BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       //padding: EdgeInsets.symmetric(vertical: 9),
//                       padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                       child: Container(
//                         width: 300,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 3,
//                               blurRadius: 10,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               child: Image.asset(
//                                 'asset/images/nasi_goreng.png',
//                                 width: 130,
//                                 height: 100,
//                               ),
//                             ),
//                             Container(
//                               width: 180,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     'Nama Menu',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     'Rp. 50.000',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       //fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 30,
//                                           height: 30,
//                                           child: ElevatedButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 jumMenu++;
//                                               });
//                                             },
//                                             child: Text(
//                                               '+',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Color(0xFFF0BB62),
//                                               shape: CircleBorder(),
//                                               padding: EdgeInsets.all(0),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         SizedBox(
//                                           width: 30,
//                                           height: 30,
//                                           child: ElevatedButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 if (jumMenu > 0) {
//                                                   jumMenu--;
//                                                 }
//                                               });
//                                             },
//                                             child: Text(
//                                               '-',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Color(0xFFF0BB62),
//                                               shape: CircleBorder(),
//                                               padding: EdgeInsets.all(0),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Container(
//                                       padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(),
//                                       ),
//                                       child: Text(
//                                         "$jumMenu",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//               //Listview minuman
//               ListView.builder(
//                   physics: BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       //padding: EdgeInsets.symmetric(vertical: 9),
//                       padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                       child: Container(
//                         width: 300,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 3,
//                               blurRadius: 10,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               alignment: Alignment.center,
//                               child: Image.asset(
//                                 'asset/images/lemon_tea.png',
//                                 width: 130,
//                                 height: 100,
//                               ),
//                             ),
//                             Container(
//                               width: 180,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text(
//                                     'Nama Menu',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     'Rp. 50.000',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       //fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 30,
//                                           height: 30,
//                                           child: ElevatedButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 jumMenu++;
//                                               });
//                                             },
//                                             child: Text(
//                                               '+',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Color(0xFFF0BB62),
//                                               shape: CircleBorder(),
//                                               padding: EdgeInsets.all(0),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         SizedBox(
//                                           width: 30,
//                                           height: 30,
//                                           child: ElevatedButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 if (jumMenu > 0) {
//                                                   jumMenu--;
//                                                 }
//                                               });
//                                             },
//                                             child: Text(
//                                               '-',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Color(0xFFF0BB62),
//                                               shape: CircleBorder(),
//                                               padding: EdgeInsets.all(0),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     child: Container(
//                                       padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(),
//                                       ),
//                                       child: Text(
//                                         '$jumMenu',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ],
//           )),

// //ini

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:ambwproyek/user/cartcontroller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';

// import '../admin/editData.dart';
// import '../dataclass.dart';
// import '../menuService.dart';

// class Menu extends StatefulWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   State<Menu> createState() => _MenuState();
// }

// class _MenuState extends State<Menu> with TickerProviderStateMixin {
//   int _itemCount = 0;
//   int jumMenu = 0;
//   @override
//   Widget build(BuildContext context) {
//     TabController tabController = TabController(length: 1, vsync: this);
//     return Scaffold(
//       body: Column(
//         children: [
//           // Text(
//           //   'MENU',
//           //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           // ),
//           SizedBox(
//             height: 10,
//           ),
//           Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             elevation: 4,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFFF0BB62),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TabBar(
//                 indicator: BoxDecoration(
//                   color: Color(0xFFF4EEA9),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 controller: tabController,
//                 isScrollable: true,
//                 //labelPadding: EdgeInsets.symmetric(horizontal: 30),
//                 labelPadding: EdgeInsets.fromLTRB(80, 0, 80, 0),
//                 tabs: [
//                   Tab(
//                     child: Text(
//                       'MENU',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     // child: Align(
//                     //     alignment: Alignment.center,
//                     //     child: Icon(Icons.rice_bowl, color: Colors.black)),
//                   ),
//                   // Tab(
//                   //   child: Align(
//                   //       alignment: Alignment.center,
//                   //       child: Icon(Icons.coffee, color: Colors.black)),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Color(0xFFF4EEA9),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   'No Meja / No Transaksi : 5 / A123 ',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: [
//                 StreamBuilder<QuerySnapshot>(
//                   stream: DatabaseMakanan.getData(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     } else if (snapshot.hasData || snapshot.data != null) {
//                       return ListView.builder(
//                         physics: BouncingScrollPhysics(),
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           DocumentSnapshot doc = snapshot.data!.docs[index];
//                           return ListTile(
//                             title: Text(doc['Nama']),
//                             subtitle: Text(doc['Harga']),
//                             leading: ConstrainedBox(
//                               constraints: BoxConstraints(
//                                 minWidth: 100,
//                                 minHeight: 100,
//                                 maxWidth: 200,
//                                 maxHeight: 200,
//                               ),
//                               child: Image.network(
//                                 doc['Gambar'],
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 IconButton(
//                                   icon: Icon(Icons.remove),
//                                   onPressed: () {
//                                     setState(
//                                       () {
//                                         _itemCount--;
//                                       },
//                                     );
//                                   },
//                                 ),
//                                 Text(_itemCount.toString()),
//                                 IconButton(
//                                   icon: Icon(Icons.add),
//                                   onPressed: () {
//                                     setState(
//                                       () {
//                                         _itemCount++;
//                                         // cartController.addProduk(menu.produk[index]);
//                                       },
//                                     );
//                                   },
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     }
//                     return Center(
//                       child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                       ),
//                     );
//                   },
//                 ),
//                 // StreamBuilder<QuerySnapshot>(
//                 //   stream: DatabaseMinuman.getData(),
//                 //   builder: (context, snapshot) {
//                 //     if (snapshot.hasError) {
//                 //       return Text('Error: ${snapshot.error}');
//                 //     } else if (snapshot.hasData || snapshot.data != null) {
//                 //       return ListView.builder(
//                 //         physics: BouncingScrollPhysics(),
//                 //         itemCount: snapshot.data!.docs.length,
//                 //         itemBuilder: (context, index) {
//                 //           DocumentSnapshot doc = snapshot.data!.docs[index];
//                 //           return ListTile(
//                 //             title: Text(doc['Nama']),
//                 //             subtitle: Text(doc['Harga']),
//                 //             trailing: Row(
//                 //               mainAxisSize: MainAxisSize.min,
//                 //               children: <Widget>[
//                 //                 IconButton(
//                 //                   icon: Icon(Icons.remove),
//                 //                   onPressed: () {
//                 //                     setState(
//                 //                       () {
//                 //                         _itemCount--;
//                 //                       },
//                 //                     );
//                 //                   },
//                 //                 ),
//                 //                 Text(_itemCount.toString()),
//                 //                 IconButton(
//                 //                   icon: Icon(Icons.add),
//                 //                   onPressed: () {
//                 //                     setState(
//                 //                       () {
//                 //                         _itemCount++;
//                 //                       },
//                 //                     );
//                 //                   },
//                 //                 )
//                 //               ],
//                 //             ),
//                 //             leading: ConstrainedBox(
//                 //               constraints: BoxConstraints(
//                 //                 minWidth: 100,
//                 //                 minHeight: 100,
//                 //                 maxWidth: 200,
//                 //                 maxHeight: 200,
//                 //               ),
//                 //               child: Image.network(
//                 //                 doc['Gambar'],
//                 //                 fit: BoxFit.cover,
//                 //               ),
//                 //             ),
//                 //           );
//                 //         },
//                 //       );
//                 //     }
//                 //     return Center(
//                 //       child: CircularProgressIndicator(
//                 //         valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
