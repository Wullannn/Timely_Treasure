import 'package:flutter/material.dart';
import 'package:jam/screens/favorit_screen.dart';
import 'package:jam/screens/checkout_screen.dart';

import '../models/cart_item.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final List<CartItem> cartItems;

  const ProductDetailScreen({Key? key, required this.product, required this.cartItems}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isFavorite = false; // Status favorit, dimulai dengan false
  String? selectedColor; // Menyimpan warna yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Produk
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.product.imageAsset,
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Nama Produk
              Text(
                widget.product.nama,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 10),

              // Harga
              Text(
                'Harga: Rp${widget.product.harga.toString()}',
                style: TextStyle(fontSize: 15, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(height: 5),

              // Diskon
              Text(
                'Harga Diskon: Rp${widget.product.hargaDiskon.toString()}',
                style: TextStyle(fontSize: 17, color: Colors.red),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 20),

              // Warna Tersedia
              Text(
                'Warna Tersedia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Tombol Warna
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildColorButton('Hitam', Colors.black, Colors.white),
                  SizedBox(width: 8),
                  _buildColorButton('Putih', Colors.white, Colors.black),
                  SizedBox(width: 8),
                  _buildColorButton('Biru', Colors.blue, Colors.white),
                ],
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 20),

              // Deskripsi
              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.justify,
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 30),

              // Tombol Beli Sekarang dan Keranjang
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (selectedColor != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                selectedItems: [
                                  CartItem(
                                    name: widget.product.nama,
                                    price: widget.product.hargaDiskon.toString(),
                                    imageAsset: widget.product.imageAsset,
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Pilih warna terlebih dahulu!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Beli Sekarang',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Periksa apakah item sudah ada di cartItems
                        final existingItem =
                            widget.cartItems.where((item) => item.name == widget.product.nama).isNotEmpty;

                        if (!existingItem) {
                          // Tambahkan item baru ke keranjang
                          final newCartItem = CartItem(
                            name: widget.product.nama,
                            price: widget.product.hargaDiskon.toString(),
                            imageAsset: widget.product.imageAsset,
                            isSelected: true,
                          );
                          widget.cartItems.add(newCartItem);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${widget.product.nama} berhasil ditambahkan ke keranjang!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${widget.product.nama} sudah ada di keranjang!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }

                        // Navigasikan ke CartScreen dengan data terbaru
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(cartItems: widget.cartItems),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorButton(String colorName, Color buttonColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedColor = colorName;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedColor == colorName ? Colors.grey : buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        colorName,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
