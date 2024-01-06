import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:gen/gen.dart';

class FoodDeliveryTextField extends StatelessWidget {
  const FoodDeliveryTextField({super.key, required this.hintText, this.keyboardType});

  final String hintText;
  final TextInputType? keyboardType;

  InputBorder border() => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(32),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeHelper.toHeight(55),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          constraints: const BoxConstraints(),
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
          hintStyle: const BaseText(text: '', size: 15, color: FoodDeliveryColors.gray1, fontWeight: FontWeight.w400).style,
          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: SizeHelper.toHeight(16)),
          border: border(),
          focusedBorder: border(),
          enabledBorder: border(),
          disabledBorder: border(),
          errorBorder: border(),
          focusedErrorBorder: border(),
        ),
      ),
    );
  }
}
