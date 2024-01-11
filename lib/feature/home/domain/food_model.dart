// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodModel {
  final String? name;
  final String? specialText;
  final double? deliveryFee;
  final double? cal;
  final double? price;
  final double? rating;
  final String? duration;
  final String? imagePath;
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
  });

  FoodModel copyWith({
    String? name,
    String? specialText,
    double? deliveryFee,
    double? cal,
    double? price,
    double? rating,
    String? duration,
    String? imagePath,
    bool? isFavourite,
    List<String>? extras,
  }) {
    return FoodModel(
      name: name ?? this.name,
      specialText: specialText ?? this.specialText,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      cal: cal ?? this.cal,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      duration: duration ?? this.duration,
      imagePath: imagePath ?? this.imagePath,
      extras: extras ?? this.extras,
    );
  }
}
