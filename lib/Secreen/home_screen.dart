import 'package:flutter/material.dart';
import 'package:jam/Secreen/search_screen.dart';
import 'package:jam/Secreen/profile_screen.dart';
import 'package:jam/Secreen/favorite_screen.dart';
// import 'package:jam/Secreen/history_screen.dart'; // Import History Screen
import '../models/product.dart';
import 'cart_screen.dart';

import 'detail_screen.dart';
import 'orderhistory_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Untuk melacak tab yang aktif

  // Daftar halaman berdasarkan indeks navigasi
  final List<Widget> _pages = [
    HomePageContent(), // Halaman Home
    FavoritScreen(), // Halaman Favorite
    ProfileScreen(), // Halaman Profile
    OrderHistoryScreen(orders: [],), // Halaman Order History
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Perbarui halaman aktif
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timely Treasure',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.black, // Latar belakang hitam
      ),
      body: _pages[_selectedIndex], // Tampilkan halaman berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber, // Warna emas untuk tab aktif
        unselectedItemColor: Colors.grey, // Warna abu-abu untuk tab tidak aktif
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.black, // Latar belakang hitam
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History', // New History Tab
          ),
        ],
      ),
    );
  }
}

/// Halaman Home (GridView Produk)
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailScreen(product: produk, cartItems: []),
              ),
            );
          },
          child: Card(
            color: Colors.black, // Latar belakang kartu hitam
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Teks putih
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Harga: Rp${produk.harga.toString()}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey, // Teks abu-abu terang
                        ),
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
          ),
        );
      },
    );
  }
}
