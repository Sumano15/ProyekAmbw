import 'package:ambwproyek/dataclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailMenu extends StatelessWidget {
  final menu dtMenu;
  const DetailMenu({
    Key? key,
    required this.dtMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Menu',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFF0BB62),
        elevation: 20,
        //title: const Text('GoogleNavBar'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(dtMenu.gambar),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(dtMenu.nama),
                  Text('Harga',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  ElevatedButton(onPressed: () {}, child: Text('Tambah')),
                  ElevatedButton(onPressed: () {}, child: Text('Kurang')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
