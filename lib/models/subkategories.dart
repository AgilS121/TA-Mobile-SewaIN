class SubKategori {
  final BigInt id;
  final BigInt id_kategori;
  final String nama_kategori;

  SubKategori({
    required this.id,
    required this.id_kategori,
    required this.nama_kategori,
  });

  factory SubKategori.fromJson(Map<String, dynamic> json) {
    return SubKategori(
      id: BigInt.from(json['id'] ?? 0),
      id_kategori: BigInt.from(json['id_kategori'] ?? 0),
      nama_kategori: json['nama_kategori'] ?? '',
    );
  }
}
