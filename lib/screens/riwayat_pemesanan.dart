import 'package:flutter/material.dart';
import '../models/product.dart';
import '../witgets/order_card.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pemesanan'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (ctx, index) {
          return OrderCard(order: productList[index]);
        },
      ),
    );
  }
}
