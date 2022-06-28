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

String getRandomString(int length) {
  const characters =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}


//Transaksi

CollectionReference tblTransaksi =
    FirebaseFirestore.instance.collection('transaksiMenu');

class DatabaseTransaksi {
  static Stream<QuerySnapshot> getData() {
    return tblTransaksi.snapshots();
  }

  static Future<void> updateData(
      {required transaksiMenu data_transaksi, required String id}) async {
    DocumentReference docRef = tblTransaksi.doc(id);
    await docRef
        .update(data_transaksi.toJson())
        .whenComplete(
          () => print("{$id}Data berhasil diubah"),
        )
        .catchError((e) => print(e.toString()));
  }
  

  static Future<void> deleteData({required String id}) async {
    DocumentReference docRef = tblTransaksi.doc(id);
    await docRef
        .delete()
        .whenComplete(
          () => print("Data berhasil dihapus"),
        )
        .catchError((e) => print(e.toString()));
  }

  static Future<void> addData({required transaksiMenu data_transaksi}) async {
    DocumentReference docRef = tblTransaksi.doc(getRandomString(4));
    await docRef
        .set(data_transaksi.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }

  
}
