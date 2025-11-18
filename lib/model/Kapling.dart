// lib/model/Kapling.dart
class Kapling {
  final String id;
  final String nama;
  final String deskripsi;
  final String slug;
  final String blokId;

  Kapling({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.slug,
    required this.blokId,
  });

  factory Kapling.fromJson(Map<String, dynamic> json) {
    return Kapling(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      slug: json['slug'],
      blokId: json['blok_id'],
    );
  }
}