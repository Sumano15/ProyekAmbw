import 'package:ambwproyek/dataclass.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;
  //final _products = {}.obs;

  void addProduk(menu product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar("Item ditambah", "Item ${product.nama} ditambah",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  void removeProduct(menu product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.harga * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.harga * product.value)
      .toList().reduce((value, element) => value + element).toString();
}
