class FeaturedModel {
  final String? name;
  final String? specialText;
  final double? deliveryFee;
  final double? rating;
  final String? duration;
  final String? imagePath;
  final bool isFavourite;

  FeaturedModel({
    required this.name,
    required this.specialText,
    required this.deliveryFee,
    required this.rating,
    required this.duration,
    required this.imagePath,
    this.isFavourite = false,
  });
}
