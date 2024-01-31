import 'package:flutter/foundation.dart';
import 'package:food_delivery_flutter/feature/home/profile/application/profile_view_model.dart';
import 'package:food_delivery_flutter/feature/payment/domain/food_credit_card.dart';

class PaymentViewModel extends ChangeNotifier {
  FoodCreditCard creditCard = FoodCreditCard.empty();
  final ProfileViewModel profileViewModel;

  PaymentViewModel({required this.profileViewModel});

  bool saveCreditCard({
    required String cardHolderName,
    required String cardNumber,
    required String expDate,
    required String cvv,
  }) {
    creditCard = creditCard.copyWith(
      name: cardHolderName,
      cardNumber: cardNumber,
      expDate: expDate,
      cvv: int.parse(cvv),
    );

    return profileViewModel.setSavedCreditCard(creditCard);
  }
}
