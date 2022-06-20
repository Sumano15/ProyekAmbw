import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblMakanan = FirebaseFirestore.instance.collection('makanan');

class DatabaseMenu {
  static Stream<QuerySnapshot> getData() {
    return tblMakanan.snapshots();
  }

  static Future<void> addData({required menu data}) async {
    DocumentReference docRef = tblMakanan.doc();
    await docRef
        .set(data.toJson())
        .whenComplete(
          () => print("Data berhasil ditambahkan"),
        )
        .catchError((e) => print(e.toString()));
  }

  // static Future<void> tambahData({required menu itemMenu}) async {
  //   DocumentReference docRef = tblMenu.doc(itemMenu.nama);
  //   await docRef
  //       .set(itemMenu.toJson())
  //       .whenComplete(() => print("Data berhasil diTambah"))
  //       .catchError((e) => print(e));
  // }
  
}
