import 'package:food_delivery_flutter/feature/payment/domain/food_credit_card.dart';

class FoodUser {
  final String? email;
  final List<FoodCreditCard>? creditCards;

  FoodUser({
    required this.email,
    this.creditCards = const [],
  });

  factory FoodUser.empty() => FoodUser(email: null);

  FoodUser copyWith({
    String? email,
    List<FoodCreditCard>? creditCards,
  }) {
    return FoodUser(
      email: email ?? this.email,
      creditCards: creditCards ?? this.creditCards,
    );
  }

  @override
  String toString() => 'FoodUser(email: $email, creditCards: $creditCards)';
}
