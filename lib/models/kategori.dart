class Kategori {
  final BigInt id;
  final String nama_kategori;

  Kategori({
    required this.id,
    required this.nama_kategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: BigInt.from(json['id'] ?? 0),
      nama_kategori: json['nama_kategori'] ?? '',
    );
  }
}
