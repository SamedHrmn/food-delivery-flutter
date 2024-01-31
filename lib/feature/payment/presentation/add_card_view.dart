import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_flutter/feature/payment/application/payment_view_model.dart';
import 'package:food_delivery_flutter/feature/payment/presentation/add_card_view_mixin.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
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
                        title: StringConstant.cardHolderNameTitle,
                        hintText: StringConstant.cardHolderNameHint,
                        onChanged: updateCardHolderName,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return StringConstant.cardHolderNameErrorText;
                          }
                          return null;
                        },
                      ),
                      _CardTextFormField(
                        title: StringConstant.cardNumberTitle,
                        hintText: StringConstant.cardNumberHint,
                        //validator: (p0) => p0?.isCreditCardNumberValid(),
                        //? Uncomment when you want to use card number validity.
                        onChanged: updateCardNumber,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CreditCardNumberFormatter(),
                        ],
                      ),
                      _CardTextFormField(
                        title: StringConstant.expDateTitle,
                        hintText: StringConstant.expDateHint,
                        onChanged: updateExpiryDate,
                        inputFormatters: [
                          CreditCardExpirationFormatter(),
                        ],
                      ),
                      _CardTextFormField(
                        title: StringConstant.cvvTitle,
                        hintText: StringConstant.cvvHint,
                        focusNode: cvvFocus,
                        onChanged: updateCvvCode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      FoodDeliveryButton(
                        text: StringConstant.saveCard,
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            final isSuccess = context.read<PaymentViewModel>().saveCreditCard(
                                  cardHolderName: cardHolderName,
                                  cardNumber: cardNumber,
                                  expDate: expiryDate,
                                  cvv: cvvCode,
                                );

                            if (isSuccess) {
                              context.pop();
                            }
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
    required this.onChanged,
  });

  final String title;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

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
          onChanged: onChanged,
        ),
        SizedBox(
          height: SizeHelper.toHeight(24),
        ),
      ],
    );
  }
}
