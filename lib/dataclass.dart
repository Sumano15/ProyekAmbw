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

  static List<menu> products = [
  menu(nama: 'Mie Bakar', harga: '15000', gambar: 'https://cdn0-production-images-kly.akamaized.net/ZbmIfg2wSl77g2-IjkJpgPONAOM=/0x342:5989x3718/673x373/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3930827/original/066100900_1644554867-shutterstock_1984582070.jpg'),
  menu(nama: 'Nasi Kuning', harga: '20000', gambar: 'https://www.resepistimewa.com/wp-content/uploads/nasi-kuning.jpg')

];

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
