import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/order.dart';
// import '../screens/order_history_screen.dart';
import 'orderhistory_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> selectedItems;

  const CheckoutScreen({super.key, required this.selectedItems});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedPaymentMethod;

  double get subtotal {
    return widget.selectedItems.fold(0.0, (sum, item) {
      return sum +
          double.parse(item.price.replaceAll('.', '').replaceAll(',', '.'));
    });
  }

  double get shippingFee {
    return 5000.0; // Static shipping fee; you can modify it as needed
  }

  double get totalPrice {
    return subtotal + shippingFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',
          style:  TextStyle(color: Colors.amber, // Warna emas untuk judul
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black, // Set app bar background to black
      ),
      backgroundColor: Colors.white, // Set main background to black
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.grey[850],
                // Dark background for cards
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat Pengiriman:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // White text for content
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Jl. Sudirman, Palembang', // Replace with dynamic data
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white, // White text for content
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Selected Items Section
              Text(
                'Jam yang dipilih:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber, // Golden color for section title
                ),
              ),
              SizedBox(height: 8),
              ...widget.selectedItems.map(
                    (item) =>
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.grey[850],
                      // Dark background for cards
                      child: ListTile(
                        leading: Image.asset(
                          item.imageAsset,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          item.name,
                          style: TextStyle(
                              color: Colors.white), // White text for item name
                        ),
                        subtitle: Text(
                          'Rp ${item.price}',
                          style: TextStyle(
                            color: Colors.amber, // Golden color for price
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              ),
              Divider(height: 30),

              // Payment Method Section
              Text(
                'Metode Pembayaran:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber, // Golden color for section title
                ),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedPaymentMethod,
                items: [
                  DropdownMenuItem(value: 'BCA', child: Text('Bank BCA')),
                  DropdownMenuItem(value: 'BRI', child: Text('Bank BRI')),
                  DropdownMenuItem(
                      value: 'Bank Syariah', child: Text('Bank Syariah')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                hint: Text(
                  'Pilih Metode Pembayaran',
                  style: TextStyle(color: Colors.black), // White text for hint
                ),
                style: TextStyle(fontSize: 16, color: Colors.black),
                isExpanded: true,
                underline: Container(),
              ),
              SizedBox(height: 20),

              // Payment Breakdown Section
              Text(
                'Rincian Pembayaran:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber, // Golden color for section title
                ),
              ),
              SizedBox(height: 8),
              Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.grey[850],
                // Dark background for cards
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'Rp ${subtotal.toStringAsFixed(0)}',
                            style: TextStyle(fontSize: 16, color: Colors.amber),
                          ),
                        ],
                      ),
                      Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Biaya Pengiriman',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            'Rp ${shippingFee.toStringAsFixed(0)}',
                            style: TextStyle(fontSize: 16, color: Colors.amber),
                          ),
                        ],
                      ),
                      Divider(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Rp ${totalPrice.toStringAsFixed(0)}',
                            style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Confirmation Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Golden color for button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    if (_selectedPaymentMethod != null) {
                      // Create the order and add to the order history
                      final order = Order(
                        items: widget.selectedItems,
                        shippingAddress: 'Jl. Sudirman, Palembang',
                        paymentMethod: _selectedPaymentMethod!,
                        totalPrice: totalPrice.toString(),
                        orderDate: DateTime.now(),
                      );

                      // Save the order (for simplicity, using a static list here)
                      final List<Order> orders = [
                        order
                      ]; // Ideally, use a provider or database

                      // Navigate to order history screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderHistoryScreen(orders: orders),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Silakan pilih metode pembayaran terlebih dahulu.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Konfirmasi Pembayaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}