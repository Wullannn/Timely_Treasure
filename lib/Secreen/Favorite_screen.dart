import 'package:flutter/material.dart';
import '../models/product.dart'; 

class FavoritScreen extends StatelessWidget {
  final List<Product> favoritItems;

  const FavoritScreen({Key? key, required this.favoritItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit Produk'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: favoritItems.isEmpty
          ? Center(child: Text('Tidak ada produk favorit.'))
          : ListView.builder(
              itemCount: favoritItems.length,
              itemBuilder: (context, index) {
                final product = favoritItems[index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  leading: Image.network(product.imageAsset, width: 50),
                  title: Text(product.nama),
                  subtitle: Text('Harga: Rp${product.harga}'),
                );
              },
            ),
    );
  }
}
