import 'cart_item.dart';

class Order {
  final List<CartItem> items;
  final String shippingAddress;
  final String paymentMethod;
  final String totalPrice;
  final DateTime orderDate;

  Order({
    required this.items,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.totalPrice,
    required this.orderDate,
  });
}
