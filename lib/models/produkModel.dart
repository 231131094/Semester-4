class Produk {
  final String nama;
  final String harga;
  final String deskripsi;
  final String gambar;
  final String namaToko;
  final String kota;
  final String id;

  Produk({
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
    required this.namaToko,
    required this.kota,
    required this.id,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      namaToko: json['namaToko'],
      kota: json['kota'],
      id: json['id'],
    );
  }
}
