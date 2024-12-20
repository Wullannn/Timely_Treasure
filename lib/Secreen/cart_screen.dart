import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../widgets/cartitemitile.dart';
import '../widgets/cartsummary.dart';
import 'checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

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
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartProvider.cartItems[index];
                return CartItemTile(
                  item: item,
                  onCheckboxChanged: () {
                    cartProvider.toggleItemSelection(item);
                  },
                );
              },
            ),
          ),
          CartSummary(
            selectedItemCount: cartProvider.selectedItemCount,
            totalPrice: cartProvider.totalPrice,
            onCheckoutPressed: () {
              final selectedItems = cartProvider.cartItems
                  .where((item) => item.isSelected)
                  .toList();
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
