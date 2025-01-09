import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/searchhistory.dart';
import 'detail_screen.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _searchHistory = [];
  List<Product> _filteredProducts = productList;


  void _addToSearchHistory(String query) {
    if (query.isNotEmpty && !_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.insert(0, query);
      });
    }
  }


  void _removeFromSearchHistory(String query) {
    setState(() {
      _searchHistory.remove(query);
    });
  }


  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = productList.where((product) {
        return product.nama.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Ganti latar belakang menjadi hitam
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          // Gunakan warna emas/kuning untuk ikon kembali
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800], // Latar belakang abu-abu gelap
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.amber),
              // Ikon pencarian dengan warna emas/kuning
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Cari produk",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.grey), // Teks petunjuk abu-abu terang
                  ),
                  style: TextStyle(color: Colors.white),
                  // Teks inputan berwarna putih
                  onChanged: (query) {
                    _filterProducts(query);
                  },
                  onSubmitted: (query) {
                    _addToSearchHistory(query);
                    _searchController.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Latar belakang utama menjadi hitam
        child: Column(
          children: [
            // Widget Riwayat Pencarian
            if (_searchHistory.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchHistory(
                  history: _searchHistory,
                  onSelect: (query) {
                    _searchController.text = query;
                    _filterProducts(query);
                  },
                  onRemove: _removeFromSearchHistory,
                ),
              ),
            Expanded(
              // Menampilkan daftar produk
              child: _filteredProducts.isEmpty
                  ? Center(
                child: Text(
                  "Tidak ada produk ditemukan.",
                  style: TextStyle(color: Colors
                      .grey), // Teks abu-abu terang saat tidak ada produk
                ),
              )
                  : ListView.builder(
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];
                  return ListTile(
                    leading: Image.asset(
                      product.imageAsset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      product.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .black, // Judul produk dengan warna emas/kuning
                      ),
                    ),
                    subtitle: Text(
                      "Rp ${product.harga.toStringAsFixed(0)}",
                      style: TextStyle(
                          color: Colors.white), // Harga berwarna putih
                    ),
                    onTap: () {
                      // Navigasi ke halaman detail produk
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(
                                product: product,
                                cartItems: [],
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}