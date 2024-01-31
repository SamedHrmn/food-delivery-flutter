import 'package:flutter/foundation.dart';
import 'package:food_delivery_flutter/feature/auth/domain/food_user.dart';
import 'package:food_delivery_flutter/feature/payment/domain/food_credit_card.dart';

class ProfileViewModel extends ChangeNotifier {
  FoodUser foodUser = FoodUser.empty();

  bool setSavedCreditCard(FoodCreditCard card) {
    final currentCards = foodUser.creditCards?.toList() ?? <FoodCreditCard>[];

    if (currentCards.isNotEmpty && currentCards.firstWhere((element) => element.cardNumber == card.cardNumber, orElse: () => FoodCreditCard.empty()).cardNumber != null) {
      notifyListeners();
      return false;
    }

    currentCards.add(card);

    foodUser = foodUser.copyWith(
      creditCards: currentCards,
    );
    notifyListeners();
    return true;
  }
}
