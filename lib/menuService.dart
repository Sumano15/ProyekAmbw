import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference akunRef = FirebaseFirestore.instance.collection('menu');

class DatabaseMenu {
  static Stream<QuerySnapshot> getData() {
    return akunRef.snapshots();
  }

  static Future<void> addData({required menu data}) async {
    DocumentReference docRef = akunRef.doc();

    await docRef
        .set(data.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }
}
