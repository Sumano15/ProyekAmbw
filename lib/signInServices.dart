import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

CollectionReference akunRef = FirebaseFirestore.instance.collection('akun');

class DataAkun {
  static Stream<QuerySnapshot> getData() {
    return akunRef.snapshots();
  }

  static Stream<QuerySnapshot> getDataByID(String id) {
    return akunRef.where('id', isEqualTo: id).snapshots();
  }

  static Future<void> addData({required akun data, required String id}) async {
    DocumentReference docRef = akunRef.doc(id);

    await docRef
        .set(data.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }
}
