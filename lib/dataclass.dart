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
  
  static menu fromSnapshot(DocumentSnapshot snap) {
    menu product = menu(
      nama: snap['Nama'],
      harga: snap['Harga'],
      gambar: snap['Gambar'],
    );
  return product;
  }

}



class transaksi {
  final menu dataMenu;
  final String jumlah;
  final String total;

  transaksi({
    required this.dataMenu,
    required this.jumlah,
    required this.total,
  });

  Map<String, dynamic> toJson() => {
        'dataMenu': dataMenu.toJson(),
        'jumlah': jumlah,
        'total': total,
      };

  factory transaksi.fromJson(Map<String, dynamic> json) {
    return transaksi(
      dataMenu: menu.fromJson(json['dataMenu']),
      jumlah: json['jumlah'],
      total: json['total'],
    );
  }
}
