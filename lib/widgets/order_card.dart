import 'package:flutter/material.dart';
import '../models/product.dart';

class OrderCard extends StatelessWidget {
  final Product order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.asset(
          order.imageAsset,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(order.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.description,
              style: TextStyle(fontSize: 12),
            ),
            Text(
              'Status: ${order.status}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              'Rp ${order.hargaDiskon}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Aksi ketika tombol ditekan
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Detail untuk ${order.nama}')),
            );
          },
          child: Text('Detail'),
        ),
      ),
    );
  }
}