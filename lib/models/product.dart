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


List<Product> productList = [
  Product(
    nama: "Alba",
    imageAsset: "images/Alba.jpg",
    harga: 150000,
    diskon: 0.10,
    rating: 4.8,

  ),
  Product(
    nama: "Apple",
    imageAsset: "images/apple.png",
    harga: 450000,
    diskon: 0.20,
    rating: 4.9,
  ),
  Product(
    nama: "Fossil",
    imageAsset: "images/fossil.jpg",
    harga: 100000,
    diskon: 0.15,
    rating: 4.8,
  ),
  Product(
    nama: "Alexandre Christie",
    imageAsset: "images/Alexandre_Christie.jpg",
    harga: 125000,
    diskon: 0.15,
    rating: 4.8,
  ),
  Product(
    nama: "AudemarsPiguet",
    imageAsset: "images/AudemarsPiguet.jpg",
    harga: 142000,
    diskon: 0.10,
    rating: 4.9,
  ),
  Product(
    nama: "Bonia",
    imageAsset: "images/Bonia.jpg",
    harga: 170000,
    diskon: 0.13,
    rating: 4.8,
  ),
  Product(
    nama: "Calvin klein",
    imageAsset: "images/Calvinklein.jpg",
    harga: 210000,
    diskon: 0.15,
    rating: 4.8,
  ),
  Product(
    nama: "Casio",
    imageAsset: "images/Casio.jpeg",
    harga: 250000,
    diskon: 0.15,
    rating: 4.8,
  ),
  Product(
    nama: "Casio Baby-G",
    imageAsset: "images/CasioBaby-G.jpg",
    harga: 700000,
    diskon: 0.15,
    rating: 4.9,
  ),
  Product(
    nama: "Jaeger LeCourte",
    imageAsset: "images/JaegerLeCourte.jpg",
    harga: 560000,
    diskon: 0.14,
    rating: 4.83,
  ),
  Product(
    nama: "Michael Cors",
    imageAsset: "images/MichaelCors.jpg",
    harga: 890000,
    diskon: 0.10,
    rating: 4.82,
  ),
  Product(
    nama: "Patek Philipe",
    imageAsset: "images/PatekPhilipe.jpg",
    harga: 980000,
    diskon: 0.17,
    rating: 4.9,
  ),
  Product(
    nama: "Timex",
    imageAsset: "images/Timex.jpg",
    harga: 370000,
    diskon: 0.20,
    rating: 4.85,
  ),
  Product(
    nama: "Tissot",
    imageAsset: "images/Tissot.jpg",
    harga: 100000,
    diskon: 0.15,
    rating: 4.8,
  ),
  Product(
    nama: "TisortT Touch",
    imageAsset: "images/TisortT-Touch.jpeg",
    harga: 880000,
    diskon: 0.18,
    rating: 4.8,
  ),
];
