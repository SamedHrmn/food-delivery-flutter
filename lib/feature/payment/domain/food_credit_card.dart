class FoodCreditCard {
  final String? name;
  final String? cardNumber;
  final String? expDate;
  final int? cvv;

  FoodCreditCard({
    required this.name,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
  });

  factory FoodCreditCard.empty() => FoodCreditCard(
        name: null,
        cardNumber: null,
        expDate: null,
        cvv: null,
      );

  FoodCreditCard copyWith({
    String? name,
    String? cardNumber,
    String? expDate,
    int? cvv,
  }) {
    return FoodCreditCard(
      name: name ?? this.name,
      cardNumber: cardNumber ?? this.cardNumber,
      expDate: expDate ?? this.expDate,
      cvv: cvv ?? this.cvv,
    );
  }
}
