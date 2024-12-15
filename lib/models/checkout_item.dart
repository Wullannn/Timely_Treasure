import 'dart:ui';

class CheckoutItem {
  final String name;
  final int harga;
  final String imageAsset;
  final double diskon;
  final List<Color> colors;
  bool isSelected;

  CheckoutItem({
    required this.name,
    required this.harga,
    required this.imageAsset,
    required this.diskon,
    required this.colors,
    this.isSelected = false,
  });
}
