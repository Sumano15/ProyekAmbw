class Mmenu {
  String namaMenu;
  String hargaMenu;
  String gambarUrl;
  String kategori;

  Mmenu(this.namaMenu, this.hargaMenu, this.gambarUrl, this.kategori);

   Map<String, dynamic> toJson() {
    return {
      "gambar": gambarUrl,
      "harga": hargaMenu,
      "nama": namaMenu,
      "kategori": kategori,
    };
  }

  factory Mmenu.fromJson(Map<String, dynamic> json) {
    return Mmenu(
      json['nama'] as String,
      json['harga'] as String,
      json['gambar'] as String,
      json['kategori'] as String,
    );
  }




}