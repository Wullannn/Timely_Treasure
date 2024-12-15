import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  final List<Product> favoritProducts = [
    productList[0], // Alba
    productList[1], // Apple
    productList[4], // AudemarsPiguet
    productList[7], // Casio
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit Produk'),
        backgroundColor: Colors.blueGrey,
      ),
      body: favoritProducts.isEmpty
          ? Center(child: Text('Belum ada produk favorit.'))
          : ListView.builder(
              itemCount: favoritProducts.length,
              itemBuilder: (context, index) {
                final product = favoritProducts[index];
                return Card(
                  key: ValueKey(product.nama),
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.asset(
                      product.imageAsset,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.nama),
                    subtitle: Text(
                        'Harga: Rp${product.hargaDiskon} - Rating: ${product.rating}⭐'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          favoritProducts.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${product.nama} telah dihapus dari favorit!'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
