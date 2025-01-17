import 'dart:ui';

class Product {
  final String nama;
  final String imageAsset;
  final int harga;
  final double diskon; // Diskon dalam persen (contoh: 0.15 untuk 15%)
  final double rating; // Skala 1 hingga 5
  final List<Color> colors;
  late final String status; // Status pesanan (misalnya: "Selesai", "Dikirim")
  final String description;


  Product({
    required this.nama,
    required this.imageAsset,
    required this.harga,
    required this.diskon,
    required this.rating,
    required this.colors,
    required this.status,
    required this.description,
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
    colors: [],
    status: 'Selesai',
    description: 'Jam Tangan Alba Fashion Wanita 100% Original Gray Leather AH8376 X1',


  ),
  Product(
    nama: "Apple",
    imageAsset: "images/apple.png",
    harga: 450000,
    diskon: 0.20,
    rating: 4.9,
    colors: [],
    status: 'Dikirim',
    description: 'Jual Apple smart watch Series 9 45MM midnight',
  ),
  Product(
    nama: "Fossil",
    imageAsset: "images/fossil.jpg",
    harga: 100000,
    diskon: 0.15,
    rating: 4.8,
    colors: [],
    status: 'Selesai',
    description:'Jual Jam Tangan Fossil ES4141',
  ),
  Product(
    nama: "Alexandre Christie",
    imageAsset: "images/Alexandre_Christie.jpg",
    harga: 125000,
    diskon: 0.15,
    rating: 4.8,
    colors: [],
    status: 'Dikirim',
    description: 'ALEXANDRE CHRISTIE PRIA AC 643 ROSE GOLD',
  ),
  Product(
    nama: "AudemarsPiguet",
    imageAsset: "images/AudemarsPiguet.jpg",
    harga: 142000,
    diskon: 0.10,
    rating: 4.9,
    colors: [],
    status: 'Selesai',
    description: 'JAM TANGAN PRIA MODEL AP ROO GREY DIAL CHRONOGRAPH 43MM 2642 APF QUICK RELEASE ON RUBBER',
  ),
  Product(
    nama: "Bonia",
    imageAsset: "images/Bonia.jpg",
    harga: 170000,
    diskon: 0.13,
    rating: 4.8,
    colors: [],
    status: 'Selesai',
    description: 'Bonia Tesoro BNB10435-2217',
  ),
  Product(
    nama: "Calvin klein",
    imageAsset: "images/Calvinklein.jpg",
    harga: 210000,
    diskon: 0.15,
    rating: 4.8,
    colors: [],
    status: 'Selesai',
    description: 'CALVIN KLEIN Addict Small Stainless Steel Bracelet K7W2S116',
  ),
  Product(
    nama: "Casio",
    imageAsset: "images/Casio.jpeg",
    harga: 250000,
    diskon: 0.15,
    rating: 4.8,
    colors: [],
    status: 'Selesai',
    description: 'Casio Digital Jam Tangan Wanita Gold Rantai LA-670WGA-9A Original',
  ),
  Product(
    nama: "Casio Baby-G",
    imageAsset: "images/CasioBaby-G.jpg",
    harga: 700000,
    diskon: 0.15,
    rating: 4.9,
    colors: [],
    status: 'Dikirim',
    description: 'Baby-G GM-S Bracelet Series MSG-S200DG-4ADR Brand New Fullset with Tag 2 Years Warranty by Casio Color Rose Gold',
  ),
  Product(
    nama: "Jaeger LeCourte",
    imageAsset: "images/JaegerLeCourte.jpg",
    harga: 560000,
    diskon: 0.14,
    rating: 4.83,
    colors: [],
    status: 'Dikirim',
    description: 'Jaeger-LeCoultre Master Ultra Thin Perpetual',
  ),
  Product(
    nama: "Michael Cors",
    imageAsset: "images/MichaelCors.jpg",
    harga: 890000,
    diskon: 0.10,
    rating: 4.82,
    colors: [],
    status: 'Dikirim',
    description: 'Jam Tangan Michael Kors Oversized Blair Pavé Silver-Tone Watch',
  ),
  Product(
    nama: "Patek Philipe",
    imageAsset: "images/PatekPhilipe.jpg",
    harga: 980000,
    diskon: 0.17,
    rating: 4.9,
    colors: [],
    status: 'Selesai',
    description: 'Patek Philippe Annual Calendar Complications 5396R-015',
  ),
  Product(
    nama: "Timex",
    imageAsset: "images/Timex.jpg",
    harga: 370000,
    diskon: 0.20,
    rating: 4.85,
    colors: [],
    status: 'Dikirim',
    description: 'Timex Weekender TW2W86000 Indiglo White Dial Green Fabric Strap',
  ),
  Product(
    nama: "Tissot",
    imageAsset: "images/Tissot.jpg",
    harga: 100000,
    diskon: 0.15,
    rating: 4.8,
    colors: [],
    status: 'Dikirim',
    description: 'TISSOT SEASTAR 2000 PROFESSIONAL POWERMATIC 80 CERAMIC BEZEL ORIGINAL',
  ),
  Product(
    nama: "TisortT Touch",
    imageAsset: "images/TisortT-Touch.jpeg",
    harga: 880000,
    diskon: 0.18,
    rating: 4.8,
    colors: [],
    status: 'Selesai',
    description: '',
  ),
];
