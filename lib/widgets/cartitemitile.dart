import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onCheckboxChanged;
  final VoidCallback onDeletePressed;
  final VoidCallback onIncreaseQuantity;
  final VoidCallback onDecreaseQuantity;

  const CartItemTile({
    Key? key,
    required this.item,
    required this.onCheckboxChanged,
    required this.onDeletePressed,
    required this.onIncreaseQuantity,
    required this.onDecreaseQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3), // shadow position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: item.isSelected,
            onChanged: (value) => onCheckboxChanged(),
            shape: const CircleBorder(),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Rounded image corners
            child: Image.asset(
              item.imageAsset,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Rp ${item.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Pusatkan semua elemen secara horizontal
            crossAxisAlignment: CrossAxisAlignment.center, // Sejajarkan elemen secara vertikal
            children: [
              // Tombol Kurangi
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.blueGrey),
                onPressed: onDecreaseQuantity, // Fungsi untuk mengurangi jumlah produk
              ),
              // Teks Jumlah
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Memberi jarak horizontal
                child: Text(
                  '${item.quantity}', // Menampilkan jumlah produk
                  style: const TextStyle(
                    fontSize: 16, // Ukuran font
                    fontWeight: FontWeight.bold, // Font tebal
                  ),
                ),
              ),
              // Tombol Tambah
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.blueGrey),
                onPressed: onIncreaseQuantity, // Fungsi untuk menambah jumlah produk
              ),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDeletePressed,
          ),
        ],
      ),
    );
  }
}