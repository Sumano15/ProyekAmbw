import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPembayarand extends StatelessWidget {
  const DetailPembayarand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text('hehe'),
              //CartProduk(),
              //CartTotal(),
            ],
          ),
        ),
      ),
    );
  }
}
