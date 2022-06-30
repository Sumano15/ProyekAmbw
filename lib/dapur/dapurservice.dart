import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference tblTransaksi =
    FirebaseFirestore.instance.collection('transaksiMenu');

class dataTransaksi {
  static Stream<QuerySnapshot> getData() {
    return tblTransaksi.snapshots();
  }
}
