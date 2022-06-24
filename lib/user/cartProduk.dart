// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/user/cartcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduk extends StatelessWidget {
  final CartController controller = Get.find();
  CartProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return CartProdukCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProdukCard extends StatelessWidget {
  final CartController controller;
  final menu product;
  final int quantity;
  final int index;

  const CartProdukCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              product.gambar,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.nama),
          ),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text('${quantity}'),
          IconButton(
              onPressed: () {
                controller.addProduk(product);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
