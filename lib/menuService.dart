import 'dart:math';

import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblMakanan =
    FirebaseFirestore.instance.collection('makanan');

class DatabaseMakanan {
  static Stream<QuerySnapshot> getData() {
    return tblMakanan.snapshots();
  }

  static Future<void> addData({required menu data_makanan}) async {
    DocumentReference docRef = tblMakanan.doc();
    await docRef
        .set(data_makanan.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }

  static Future<void> updateData(
      {required menu data_makanan, required String id}) async {
    DocumentReference docRef = tblMakanan.doc(id);
    await docRef
        .update(data_makanan.toJson())
        .whenComplete(
          () => print("Data berhasil diubah"),
        )
        .catchError((e) => print(e.toString()));
  }

  static Future<void> deleteData({required String id}) async {
    DocumentReference docRef = tblMakanan.doc(id);
    await docRef
        .delete()
        .whenComplete(
          () => print("Data berhasil dihapus"),
        )
        .catchError((e) => print(e.toString()));
  }
}

CollectionReference tblMinuman =
    FirebaseFirestore.instance.collection('minuman');

class DatabaseMinuman {
  static Stream<QuerySnapshot> getData() {
    return tblMinuman.snapshots();
  }

  static Future<void> updateData(
      {required menu data_minuman, required String id}) async {
    DocumentReference docRef = tblMinuman.doc(id);
    await docRef
        .update(data_minuman.toJson())
        .whenComplete(
          () => print("{$id}Data berhasil diubah"),
        )
        .catchError((e) => print(e.toString()));
  }

  static Future<void> deleteData({required String id}) async {
    DocumentReference docRef = tblMinuman.doc(id);
    await docRef
        .delete()
        .whenComplete(
          () => print("Data berhasil dihapus"),
        )
        .catchError((e) => print(e.toString()));
  }

  static Future<void> addData({required menu data_minuman}) async {
    DocumentReference docRef = tblMinuman.doc();
    await docRef
        .set(data_minuman.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }
}

// void main() async {
//   print(getRandomString(3)); //ynAIrUMKfk
// }

//Transaksi

CollectionReference tblTransaksi =
    FirebaseFirestore.instance.collection('transaksiMenu');

class DatabaseTransaksi {
  static Future<QuerySnapshot<Map<String, dynamic>>> getDataMenu(String id) {
    return tblTransaksi.doc(id).collection('menu').get();
  }

  static Future<void> addDocument(
      {required String docId,
      required String noMeja,
      required String uid}) async {
    DateTime now = new DateTime.now();
    DocumentReference docRef = tblTransaksi.doc(docId);
    await docRef.set({
      'id': docId,
      'NoMeja': noMeja,
      'UID': uid,
      'Tanggal': now,
    });
  }

  static Future<void> addMenu({
    required String NamaMenu,
    required int Harga,
    required int Jumlah,
    required String gambar,
    required String RandId,
  }) {
    DocumentReference docRef =
        tblTransaksi.doc(RandId).collection('menu').doc(NamaMenu);
    return docRef.set({
      'Harga': Harga,
      'Jumlah': Jumlah,
      'Gambar': gambar,
    });
  }
}
