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
}

CollectionReference tblMinuman =
    FirebaseFirestore.instance.collection('minuman');

class DatabaseMinuman {
  static Stream<QuerySnapshot> getData() {
    return tblMinuman.snapshots();
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
