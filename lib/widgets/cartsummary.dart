import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final int selectedItemCount;
  final String totalPrice;
  final VoidCallback onCheckoutPressed;

  const CartSummary({
    Key? key,
    required this.selectedItemCount,
    required this.totalPrice,
    required this.onCheckoutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black, // Latar belakang utama hitam untuk kesan eksklusif
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$selectedItemCount barang",
                style: const TextStyle(
                  color: Colors.white70,
                  // Teks abu-abu terang untuk keterbacaan
                  fontSize: 16,
                ),
              ),
              Text(
                "Rp ${totalPrice.isEmpty ? '0' : totalPrice}",
                style: const TextStyle(
                  color: Colors.amber, // Warna emas untuk harga
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                // Tombol dengan warna emas/kuning keemasan
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onCheckoutPressed,
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.black,
                  // Teks tombol berwarna hitam agar kontras dengan tombol emas
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}