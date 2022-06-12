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