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

class transaksiMenu {
  final List<String> namaMenu;
  final List<String> harga;
  final List<String> gambar;
  final List<String> jumlah;
  final String noMeja;
  final String noTransaksi;
  final String status;
  final String Uid;

  transaksiMenu({
    required this.namaMenu,
    required this.harga,
    required this.gambar,
    required this.jumlah,
    required this.noMeja,
    required this.noTransaksi,
    required this.status,
    required this.Uid,
  });

  Map<String, dynamic> toJson() => {
        'Nama': namaMenu,
        'Harga': harga,
        'Gambar': gambar,
        'Jumlah': jumlah,
        'NoMeja': noMeja,
        'NoTransaksi': noTransaksi,
        'Status': status,
        'Uid': Uid,
      };

  factory transaksiMenu.fromJson(Map<String, dynamic> json) {
    return transaksiMenu(
      namaMenu: json['Nama'],
      harga: json['Harga'],
      gambar: json['Gambar'],
      jumlah: json['Jumlah'],
      noMeja: json['NoMeja'],
      noTransaksi: json['NoTransaksi'],
      status: json['Status'],
      Uid: json['Uid'],
    );
  }
}
