import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class pembayaran extends StatefulWidget {
  final String total;
  const pembayaran({Key? key, required this.total}) : super(key: key);

  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //nnti kasi dropdown isinya detail pembayaran sama tombol kalo tombolnya di pencet arahkan ke page baru tulisannya thankyou for ordering
        child: Text('lakukan pembayaran sejumlah ${widget.total}'),
      ),
    );
  }
}
