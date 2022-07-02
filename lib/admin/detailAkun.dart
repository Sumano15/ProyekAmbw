// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ambwproyek/admin/dataAkunService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class detailAkunPage extends StatefulWidget {
  final String nama;
  final String noTelp;
  final String email;
  final String password;
  final String role;
  const detailAkunPage(
      {Key? key,
      required this.nama,
      required this.noTelp,
      required this.email,
      required this.password,
      required this.role})
      : super(key: key);

  @override
  State<detailAkunPage> createState() => _detailAkunPageState();
}

class _detailAkunPageState extends State<detailAkunPage> {
  List<String> listAkun = [];

  final TextEditingController eNama = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0BB62),
        title: Text('Detail Akun ${widget.nama}',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.person,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Nama : ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
              Text('${widget.nama}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.phone, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('No Telp : ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
              Text('${widget.noTelp}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.email, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('Email : ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('${widget.email}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.lock, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('Password : ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('${widget.password}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.shield, color: Colors.black),
              SizedBox(
                width: 10,
              ),
              Text('Role : ',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('${widget.role}',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
