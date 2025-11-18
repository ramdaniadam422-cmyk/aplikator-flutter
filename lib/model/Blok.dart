// lib/model/Blok.dart
import 'package:aplikator/model/Kapling.dart';

class Blok {
  final String id;
  final String nama;
  final String deskripsi;
  final String slug;
  final List<Kapling> kaplings;

  Blok({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.slug,
    required this.kaplings,
  });

  factory Blok.fromJson(Map<String, dynamic> json) {
    var list = json['kaplings'] as List? ?? [];
    List<Kapling> kaplings = list.map((e) => Kapling.fromJson(e)).toList();

    return Blok(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      slug: json['slug'],
      kaplings: kaplings,
    );
  }
}