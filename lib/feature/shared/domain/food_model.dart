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

  factory FoodModel.empty() => FoodModel(name: null, price: null, cal: null, rating: null, duration: null, imagePath: null);

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'specialText': specialText,
      'deliveryFee': deliveryFee,
      'cal': cal,
      'price': price,
      'rating': rating,
      'duration': duration,
      'imagePath': imagePath,
      'extras': extras,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'] != null ? map['name'] as String : null,
      specialText: map['specialText'] != null ? map['specialText'] as String : null,
      deliveryFee: map['deliveryFee'] != null ? (map['deliveryFee'] as num?)?.toDouble() : null,
      cal: map['cal'] != null ? (map['cal'] as num?)?.toDouble() : null,
      price: map['price'] != null ? (map['price'] as num?)?.toDouble() : null,
      rating: map['rating'] != null ? (map['rating'] as num?)?.toDouble() as double : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      extras: List<String>.from((map['extras'] ?? <dynamic>[])),
    );
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
