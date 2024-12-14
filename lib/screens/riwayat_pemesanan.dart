// lib/screens/order_history_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../witgets/product_card.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Product> productList = [
    Product(
      nama: "Alba",
      imageAsset: "images/Alba.jpg",
      harga: 150000,
      diskon: 0.10,
      rating: 4.8,
      colors: [],
      status: 'Selesai',
      description: 'JAM TANGAN PRIA ALEXANDRE CHRISTIE AC 6437 / AC6437 LEATHER ORIGINAL',
    ),
    Product(
      nama: "Apple",
      imageAsset: "images/apple.png",
      harga: 450000,
      diskon: 0.20,
      rating: 4.9,
      colors: [],
      status: 'Dikirim',
      description: 'JAM TANGAN PRIA ALEXANDRE CHRISTIE AC 6437 / AC6437 LEATHER ORIGINAL',
    ),
    // Tambahkan produk lainnya di sini...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index]);
          },
        ),
      ),
    );
  }
}
