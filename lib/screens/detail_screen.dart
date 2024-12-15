import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetail({required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Tambahkan aksi untuk tombol favorit
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Center(
              child: Image.network(
                product['image'],
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Nama Produk
            Text(
              product['name'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),

            // Harga
            Text(
              'Rp ${product['price'].toStringAsFixed(3)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Warna Tersedia
            Text(
              'Warna Tersedia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Pilihan warna (tombol kecil bulat)
                ColorOption(color: Colors.black),
                SizedBox(width: 10),
                ColorOption(color: Colors.white),
                SizedBox(width: 10),
                ColorOption(color: Colors.blue),
              ],
            ),
            SizedBox(height: 20),

            // Deskripsi
            Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product['description'],
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Spacer(),

            // Tombol Beli Sekarang
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi pembelian di sini
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                  EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Beli Sekarang',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk pilihan warna
class ColorOption extends StatelessWidget {
  final Color color;

  ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1),
      ),
    );
  }
}
