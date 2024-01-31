import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/payment/presentation/add_card_view.dart';

mixin AddCardViewMixin on State<AddCardView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  ValueNotifier<bool> hasFocusCvv = ValueNotifier(false);

  final cvvFocus = FocusNode();
  final formKey = GlobalKey<FormState>();

  void updateCardNumber(String n) {
    setState(() {
      cardNumber = n;
    });
  }

  void updateExpiryDate(String d) {
    setState(() {
      expiryDate = d;
    });
  }

  void updateCardHolderName(String name) {
    setState(() {
      cardHolderName = name;
    });
  }

  void updateCvvCode(String cvv) {
    setState(() {
      cvvCode = cvv;
    });
  }

  @override
  void initState() {
    super.initState();

    cvvFocus.addListener(() {
      hasFocusCvv.value = cvvFocus.hasFocus;
    });
  }

  @override
  void dispose() {
    cvvFocus.dispose();
    super.dispose();
  }
}
