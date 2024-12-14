import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../witgets/cartitemtile.dart';
import '../witgets/cartsummary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      name: "Alba",
      price: "150000",
      imageAsset: "images/Alba.jpg",
    ),
    CartItem(
      name: "Apple",
      price: "450000",
      imageAsset: "images/apple.png",
    ),
  ];

  int get _selectedItemCount =>
      _cartItems.where((item) => item.isSelected).length;

  String get _totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      if (item.isSelected) {
        total += double.parse(item.price.replaceAll('.', '').replaceAll(',', '.'));
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
          onPressed: () {},
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
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
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
              // Checkout action
            },
          ),
        ],
      ),
    );
  }
}
