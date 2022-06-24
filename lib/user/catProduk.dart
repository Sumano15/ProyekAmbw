// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/user/cartcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatProduk extends StatelessWidget {
  const CatProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: menu.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CatProdukCard(index: index);
            }));
  }
}

class CatProdukCard extends StatelessWidget {
  final cartController = Get.put(CartController());
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
              menu.products[index].gambar,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(menu.products[index].nama, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          Expanded(child: Text(menu.products[index].harga)),
          IconButton(
              onPressed: () {
                cartController.addProduk(menu.products[index]);
              },
              icon: Icon(
                Icons.add_circle,
              ))
        ],
      ),
    );
  }
}
