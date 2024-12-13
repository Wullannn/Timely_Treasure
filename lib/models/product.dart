class Product {
  final String nama;
  final String imageAsset;
  final int harga;
  final double diskon; // Diskon dalam persen (contoh: 0.15 untuk 15%)
  final double rating; // Skala 1 hingga 5

  Product({
    required this.nama,
    required this.imageAsset,
    required this.harga,
    required this.diskon,
    required this.rating,
  });

  // Menghitung harga setelah diskon
  int get hargaDiskon {
    return (harga * (1 - diskon)).round();
  }
}

