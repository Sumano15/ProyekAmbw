import 'package:ambwproyek/dataclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblMenu = FirebaseFirestore.instance.collection("menu");

class Database {
  static Stream<QuerySnapshot> getData(String namaMenu) {
    if (namaMenu == "") {
      return tblMenu.snapshots();
    } else {
      return tblMenu
          .orderBy("nama")
          .snapshots();
    }
  }

  static Future<void> tambahData({required menu itemMenu}) async {
    DocumentReference docRef = tblMenu.doc(itemMenu.nama);
    await docRef
        .set(itemMenu.toJson())
        .whenComplete(() => print("Data berhasil diTambah"))
        .catchError((e) => print(e));
  }

}
