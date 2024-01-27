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
