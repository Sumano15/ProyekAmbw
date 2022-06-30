import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class akun {
  final String nama;
  final String noTelp;
  final String email;
  final String password;
  final String role;

  akun({
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'Nama': nama,
        'No telp': noTelp,
        'email': email,
        'password': password,
        'role': role,
      };

  factory akun.fromJson(Map<String, dynamic> json) {
    return akun(
      nama: json['Nama'],
      noTelp: json['No telp'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }
}

class menu {
  final String nama;
  final String harga;
  final String gambar;

  menu({
    required this.nama,
    required this.harga,
    required this.gambar,
  });

  Map<String, dynamic> toJson() => {
        'Nama': nama,
        'Harga': harga,
        'Gambar': gambar,
      };

  factory menu.fromJson(Map<String, dynamic> json) {
    return menu(
      nama: json['Nama'],
      harga: json['Harga'],
      gambar: json['Gambar'],
    );
  }
}

class detData {
  final int? Jumlah;
  final int? Harga;
  final String? Gambar;

  detData({this.Jumlah, this.Harga, this.Gambar});

  factory detData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> sshot,
    SnapshotOptions? options,
  ) {
    final data = sshot.data();
    return detData(
      Jumlah: data?['Jumlah'] as int,
      Harga: data?['Harga'] as int,
      Gambar: data?['Gambar'] as String,
    );
  }

  Map<String, dynamic> ToFirestore() => {
        'Jumlah': Jumlah,
        'Harga': Harga,
        'Gambar': Gambar,
      };
}
