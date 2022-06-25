//import 'dart:html';
import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/menuService.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final products = <menu>[].obs;


  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllMakanan());
    super.onInit();
  }

}