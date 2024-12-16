import 'package:flutter/material.dart';
import 'package:jam/Secreen/search_screen.dart';
import 'package:jam/Secreen/profile_screen.dart'; // Tambahkan halaman Profile
import 'package:jam/Secreen/favorite_screen.dart'; // Tambahkan halaman Favorite
import '../models/product.dart';
import 'cart_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _pages = [
    HomePageContent(), 
    FavoritScreen(
      favoritItems: [],
    ), 
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: [])),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
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
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final produk = productList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  product: produk,
                  cartItems: [],
                  favoritItems: [],
                ),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    produk.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
            
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
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
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
