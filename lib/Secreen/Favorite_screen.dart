import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../provider/favorit_provider.dart'; 

class FavoritScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritItems = Provider.of<FavoritProvider>(context).favoritItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
        backgroundColor: Colors.blueGrey,
      ),
      body: favoritItems.isEmpty
          ? Center(
              child: Text(
                'Tidak ada produk favorit',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoritItems.length,
              itemBuilder: (context, index) {
                final product = favoritItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(
                      product.imageAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.nama),
                    subtitle: Text('Rp${product.hargaDiskon.toString()}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<FavoritProvider>(context, listen: false)
                            .removeFavorite(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.nama} dihapus dari favorit'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
