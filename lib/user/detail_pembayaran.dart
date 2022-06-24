// ignore_for_file: prefer_const_constructors

import 'package:ambwproyek/dataclass.dart';
import 'package:ambwproyek/user/cartProduk.dart';
import 'package:ambwproyek/user/cartTotal.dart';
import 'package:ambwproyek/user/cartcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail_pembayaran extends StatelessWidget {
  final CartController controller = Get.find();
  Detail_pembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pembayaran')),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CartProduk(),
              Text('hehe'),
              //CartTotal(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Total',
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Text(
              //       '${controller.total}',
              //       style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
