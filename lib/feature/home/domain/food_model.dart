class FoodModel {
  final String? name;
  final String? specialText;
  final double? deliveryFee;
  final double? cal;
  final double? price;
  final double? rating;
  final String? duration;
  final String? imagePath;
  final bool isFavourite;
  final List<String> extras;

  FoodModel({
    required this.name,
    this.specialText,
    this.deliveryFee,
    required this.price,
    required this.cal,
    required this.rating,
    required this.duration,
    required this.imagePath,
    this.extras = const [],
    this.isFavourite = false,
  });
}
