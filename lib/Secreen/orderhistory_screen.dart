import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/order.dart'; // Import the order model

class OrderHistoryScreen extends StatelessWidget {
  final List<Order> orders;

  const OrderHistoryScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan',
          style: TextStyle(
          color: Colors.amber, // Warna emas untuk judul
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
        backgroundColor: Colors.black,
      ),
      body: orders.isEmpty
          ? Center(child: Text('Belum ada riwayat pemesanan.'))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Pesanan anda di terima, barang akan segera di kirim'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tanggal: ${order.orderDate.toLocal()}'),
                  Text('Alamat: ${order.shippingAddress}'),
                  Text('Metode Pembayaran: ${order.paymentMethod}'),
                  Text('Total: ${order.totalPrice}'),
                ],
              ),
              onTap: () {
                // Optionally, navigate to a detailed order page
              },
            ),
          );
        },
      ),
    );
  }
}
