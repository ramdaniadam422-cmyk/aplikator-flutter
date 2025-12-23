// lib/models/aplikator_model.dart
class Aplikator {
  final String id;
  final String namaLengkap;
  final String email;
  final String token;

  Aplikator({
    required this.id,
    required this.namaLengkap,
    required this.email,
    required this.token,
  });

  factory Aplikator.fromJson(Map<String, dynamic> json) {
    return Aplikator(
      id: json['aplikator']['id'],
      namaLengkap: json['aplikator']['nama_lengkap'],
      email: json['aplikator']['email'],
      token: json['token'],
    );
  }
}
