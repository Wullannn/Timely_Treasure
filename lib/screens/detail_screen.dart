import 'package:flutter/material.dart';

import '../models/product.dart';
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
import 'home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);
=======
import 'cart_screen.dart';
import 'checkout.dart';
import 'favorite_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final List<CartItem> cartItems;
  final List<Product> favoritItems; 

  const ProductDetailScreen({
    Key? key,
    required this.product,
    required this.cartItems,
    required this.favoritItems, 
  }) : super(key: key);
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
  bool isFavorite = false; // Status favorit, dimulai dengan false
=======
  bool isFavorite = false; 
  String? selectedColor; 
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart

  @override
  Widget build(BuildContext context) {
    isFavorite =
        widget.favoritItems.any((item) => item.nama == widget.product.nama);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Menggunakan Navigator.pushReplacement untuk kembali ke HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()), // Ganti dengan halaman HomeScreen yang sesuai
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border, // Ubah ikon berdasarkan status favorit
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
                isFavorite = !isFavorite; // Mengubah status favorit
=======
                if (isFavorite) {
                  widget.favoritItems
                      .removeWhere((item) => item.nama == widget.product.nama);
                } else {
                  widget.favoritItems.add(widget.product);
                }
                isFavorite = !isFavorite;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritScreen(favoritItems: widget.favoritItems),
                  ),
                );
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart
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

              Text(
                widget.product.nama,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 10),

              Text(
                'Harga: Rp${widget.product.harga.toString()}',
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(height: 5),

              Text(
                'Harga Diskon: Rp${widget.product.hargaDiskon.toString()}',
                style: TextStyle(fontSize: 17, color: Colors.red),
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 20),

              Text(
                'Warna Tersedia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi pilih warna hitam
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Hitam',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi pilih warna putih
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Putih',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi pilih warna biru
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Biru',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey[300], thickness: 1),
              SizedBox(height: 20),

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

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
                        // Tambahkan aksi pembelian di sini
=======
                        if (selectedColor != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                selectedItems: [
                                  CartItem(
                                    name: widget.product.nama,
                                    price:
                                        widget.product.hargaDiskon.toString(),
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
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
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
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
                        // Tambahkan aksi untuk keranjang di sini
=======
                        final existingItem = widget.cartItems
                            .where((item) => item.name == widget.product.nama)
                            .isNotEmpty;

                        if (!existingItem) {
                          final newCartItem = CartItem(
                            name: widget.product.nama,
                            price: widget.product.hargaDiskon.toString(),
                            imageAsset: widget.product.imageAsset,
                            isSelected: true,
                          );
                          widget.cartItems.add(newCartItem);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${widget.product.nama} berhasil ditambahkan ke keranjang!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${widget.product.nama} sudah ada di keranjang!"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CartScreen(cartItems: widget.cartItems),
                          ),
                        );
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart
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
<<<<<<< Updated upstream:lib/screens/detail_screen.dart
=======

  Widget _buildColorButton(
      String colorName, Color buttonColor, Color textColor) {
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
>>>>>>> Stashed changes:lib/Secreen/detail_screen.dart
}
