import 'package:ambwproyek/user/detail_pembayaran.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPembayarand extends StatelessWidget {
  const DetailPembayarand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail_pembayaran()),
                  );
                },
                child: Text('Detail Pembayaran')),
          ],
        ),
      ),
    );
  }
}