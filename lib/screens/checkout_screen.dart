import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tampilan Informasi checkout
            Text(
              'Checkout Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Detil keranjang atau informasi lainnya bisa ditambahkan di sini
            Text(
              'Total Pembayaran: Rp 150,000',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Tombol untuk konfirmasi pembayaran
            ElevatedButton(
              onPressed: () {
                // Aksi setelah konfirmasi pembayaran
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pembayaran Berhasil!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Konfirmasi Pembayaran'),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
