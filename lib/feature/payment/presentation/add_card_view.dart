import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_flutter/feature/payment/application/payment_view_model.dart';
import 'package:food_delivery_flutter/feature/payment/presentation/add_card_view_mixin.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/extension/string_extension.dart';
import 'package:food_delivery_flutter/project/util/credit_card_formatter.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> with AddCardViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: SizeHelper.toWidth(20),
              right: SizeHelper.toWidth(20),
              height: SizeHelper.toHeight(320),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeHelper.toHeight(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodDeliveryIconButton(
                          onTap: () => context.pop(),
                          iconData: Icons.arrow_back_outlined,
                          size: 24,
                        ),
                        const TextFoodDelivery(text: StringConstant.addCard, size: 22),
                        SizedBox(
                          width: SizeHelper.toWidth(24),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeHelper.toHeight(16),
                  ),
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: hasFocusCvv,
                      builder: (context, hasFocus, _) {
                        return CreditCardWidget(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: hasFocus,
                          onCreditCardWidgetChange: (p0) {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              left: SizeHelper.toWidth(20),
              right: SizeHelper.toWidth(20),
              top: SizeHelper.toHeight(320),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _CardTextFormField(
                        title: 'Card Holder Name',
                        hintText: 'Name',
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please fill card holder name';
                          }
                          return null;
                        },
                      ),
                      _CardTextFormField(
                        title: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        validator: (p0) => p0?.isCreditCardNumberValid(),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CreditCardNumberFormatter(),
                        ],
                      ),
                      _CardTextFormField(
                        title: 'Exp. Date',
                        hintText: 'MM/YY',
                        inputFormatters: [
                          CreditCardExpirationFormatter(),
                        ],
                      ),
                      _CardTextFormField(
                        title: 'CVV',
                        hintText: '123',
                        focusNode: cvvFocus,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      FoodDeliveryButton(
                        text: 'Save Card',
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            context.read<PaymentViewModel>().saveCreditCard(
                                  cardHolderName: cardHolderName,
                                  cardNumber: cardNumber,
                                  expDate: expiryDate,
                                  cvv: cvvCode,
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTextFormField extends StatelessWidget {
  const _CardTextFormField({
    required this.title,
    required this.hintText,
    this.inputFormatters,
    this.focusNode,
    this.validator,
  });

  final String title;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFoodDelivery(text: title, size: 16),
        SizedBox(
          height: SizeHelper.toHeight(8),
        ),
        FoodDeliveryTextField(
          hintText: hintText,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          validator: validator,
        ),
        SizedBox(
          height: SizeHelper.toHeight(24),
        ),
      ],
    );
  }
}
