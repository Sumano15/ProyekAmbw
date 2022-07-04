//import 'dart:html';

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference transaksi =
    FirebaseFirestore.instance.collection('transaksiMenu');
    
CollectionReference menuJadi =
    FirebaseFirestore.instance.collection('menuJadi');

class dataTransaksi {
  static Stream<QuerySnapshot> getData() {
    return transaksi.snapshots();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDataMenu(String id) {
    return transaksi.doc(id).collection('menu').get();
  }

  // static Future<QuerySnapshot<Map<String, dynamic>>> getDataMenuBelumSelesai(
  //     String id) {
    
  //   transaksi.doc(id).collection('menu').doc().collection('Status').where('Status', isEqualTo: 'DiProses').get();
  // }

  // static Future<QuerySnapshot<Map<String, dynamic>>> getDataMenuBelumSelesai(
  //     {required String id}) {
  //   CollectionReference<Map<String, dynamic>> docRef =
  //       transaksi.doc(id).collection('menu').doc().collection('Status')
  // }

  static Future<void> updateData(
      {required String id, required String NamaMenu}) {
    DocumentReference docRef =
        transaksi.doc(id).collection('menu').doc(NamaMenu);
    return docRef.update({'Status': 'Selesai'});
  }


  static Future<void> addDocument(
      {required String NamaMenu,
      required int jumlah,}) async {
    DocumentReference docRef = menuJadi.doc(NamaMenu);
    await docRef.update({
      'Jumlah': jumlah,
    });
  }

  static Future<QuerySnapshot<Object?>> getDataJadi(){
    return menuJadi.get();
  }
}
