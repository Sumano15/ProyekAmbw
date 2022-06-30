//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference transaksi =
    FirebaseFirestore.instance.collection('transaksiMenu');

class dataTransaksi {
  static Stream<QuerySnapshot> getData() {
    return transaksi.snapshots();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDataMenu(String id) {
    return transaksi.doc(id).collection('menu').get();
  }

  static Future<void> updateData(
      {required String id, required String NamaMenu}) {
    DocumentReference docRef =
        transaksi.doc(id).collection('menu').doc(NamaMenu);
    return docRef.update({'Status': 'Selesai'});
  }
}
