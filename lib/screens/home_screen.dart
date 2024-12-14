import 'package:flutter/material.dart';
import 'package:jamm/screens/search_screen.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timely Treasure'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7, // Menentukan proporsi kartu
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final produk = productList[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar produk
                Expanded(
                  flex: 2,
                  child: Image.network(
                    produk.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                // Informasi produk
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produk.nama,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Harga: Rp${produk.harga.toString()}',
                        style: TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        'Harga Diskon: Rp${produk.hargaDiskon.toString()}',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        'Rating: ${produk.rating} ',
                        style: TextStyle(color: Colors.amber),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '-${(produk.diskon * 100).toInt()}%',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
