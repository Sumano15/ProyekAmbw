//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference dataAkun =
    FirebaseFirestore.instance.collection('akun');

class manageDataAkun {
  static Stream<QuerySnapshot> getData() {
    return dataAkun.snapshots();
  }

  // static Future<QuerySnapshot<Map<String, dynamic>>> getDataAkun(String id) {
  //   return dataAkun.doc(id).
  // }


}
