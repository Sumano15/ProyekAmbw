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

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<menu>> getAllProducts() {
    return _firebaseFirestore
      .collection('makanan')
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) => menu.fromSnapshot(doc)).toList();
      }
      );
  }
}
