import 'package:flutter/foundation.dart';
import 'package:food_delivery_flutter/feature/payment/domain/food_credit_card.dart';

class PaymentViewModel extends ChangeNotifier {
  FoodCreditCard creditCard = FoodCreditCard.empty();

  void saveCreditCard({
    required String cardHolderName,
    required String cardNumber,
    required String expDate,
    required String cvv,
  }) {
    creditCard = creditCard.copyWith(
      name: cardHolderName,
      cardNumber: cardNumber,
      expDate: expDate,
    );
  }
}
