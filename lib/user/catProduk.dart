// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/productController.dart';
import 'package:ambwproyek/user/cartcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatProduk extends StatelessWidget {
  final productController = Get.put(ProductController());
  CatProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatProdukCard(index: index);
              })),
    );
  }
}

class CatProdukCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatProdukCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              productController.products[index].gambar,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            productController.products[index].nama,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Expanded(child: Text('${productController.products[index].harga}'),),
          IconButton(
              onPressed: () {
                cartController.addProduk(productController.products[index]);
              },
              icon: Icon(
                Icons.add_circle,
              ))
        ],
      ),
    );
  }
}

// MINUMAN

class CatProdukMinuman extends StatelessWidget {
  final productControllerMinuman = Get.put(ProductControllerMinuman());
  CatProdukMinuman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
          child: ListView.builder(
              itemCount: productControllerMinuman.products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatProdukCardMinuman(index: index);
              })),
    );
  }
}

class CatProdukCardMinuman extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductControllerMinuman productControllerMinuman = Get.find();
  final int index;
  CatProdukCardMinuman({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              productControllerMinuman.products[index].gambar,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            productControllerMinuman.products[index].nama,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Expanded(
            child: Text('${productControllerMinuman.products[index].harga}'),
          ),
          IconButton(
              onPressed: () {
                cartController.addProduk(productControllerMinuman.products[index]);
              },
              icon: Icon(
                Icons.add_circle,
              ))
        ],
      ),
    );
  }
}
