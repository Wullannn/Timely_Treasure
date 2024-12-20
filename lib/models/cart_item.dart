class CartItem {
  final String name;
  final String price;
  final String imageAsset;
  bool isSelected;
  int quantity;

  var harga;

  CartItem({
    required this.name,
    required this.price,
    required this.imageAsset,
    this.isSelected = false,
    this.quantity = 1,
  });
}