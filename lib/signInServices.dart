import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

CollectionReference akunRef = FirebaseFirestore.instance.collection('akun');

class DataAkun {
  static Stream<QuerySnapshot> getData() {
    return akunRef.snapshots();
  }

  static Future<void> addData({required akun data}) async {
    DocumentReference docRef = akunRef.doc();

    await docRef
        .set(data.toJson())
        .whenComplete(() => print("Data berhasil ditambahkan"))
        .catchError((e) => print("Data Gagal:" + e));
  }
}
