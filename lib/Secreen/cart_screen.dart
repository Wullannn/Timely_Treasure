import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cartitemitile.dart';
import '../widgets/cartsummary.dart';
import 'checkout.dart';


class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems; // Tambahkan properti cartItems

  const CartScreen({super.key, required this.cartItems}); // Sesuaikan required
  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {
  late List<CartItem> cartItems; // Gunakan late untuk inisialisasi

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems; // Ambil data dari widget.cartItems
  }

  int get _selectedItemCount =>
      cartItems.where((item) => item.isSelected).length;

  String get _totalPrice {
    double total = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        total += double.parse(
          item.price.replaceAll('.', '').replaceAll(',', '.'),
        );
      }
    }
    return total.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Keranjang",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemTile(
                  item: item,
                  onCheckboxChanged: () {
                    setState(() {
                      item.isSelected = !item.isSelected;
                    });
                  },
                );
              },
            ),
          ),
          CartSummary(
            selectedItemCount: _selectedItemCount,
            totalPrice: _totalPrice,
            onCheckoutPressed: () {
              // Mengirim daftar item yang dipilih ke halaman CheckoutScreen
              final selectedItems =
              cartItems.where((item) => item.isSelected).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(
                    selectedItems: selectedItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
