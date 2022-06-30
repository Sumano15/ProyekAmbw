import 'package:ambwproyek/dapur/detailPesanan.dart';
import 'package:ambwproyek/dapur/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ambwproyek/dapur/dapurservice.dart';

class StatusChanger extends StatefulWidget {
  final String Gambar;
  final String Nama;
  final String Harga;
  final String Status;
  final String idPesanan;
  final String Uid;
  final String tanggal;
  final String noMeja;
  const StatusChanger(
      {Key? key,
      required this.Gambar,
      required this.Nama,
      required this.Harga,
      required this.Status,
      required this.idPesanan,
      required this.Uid,
      required this.tanggal,
      required this.noMeja})
      : super(key: key);

  @override
  State<StatusChanger> createState() => _StatusChangerState();
}

class _StatusChangerState extends State<StatusChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text('Status Changer',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.Gambar.toString()),
                radius: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.Nama.toString(),
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.Harga.toString(),
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.Status.toString(),
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    dataTransaksi.updateData(
                        id: widget.idPesanan, NamaMenu: widget.Nama);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => detailPesanan(
                                idPesanan: widget.idPesanan,
                                Uid: widget.Uid,
                                tanggal: widget.tanggal,
                                noMeja: widget.noMeja,
                                Status: widget.Status)),
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Selesai')),
            ],
          ),
        ),
      ),
    );
  }
}
