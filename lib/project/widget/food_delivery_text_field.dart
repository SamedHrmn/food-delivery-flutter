import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:gen/gen.dart';

class FoodDeliveryTextField extends StatelessWidget {
  const FoodDeliveryTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.hintColor,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.focusNode,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final Color? hintColor;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  InputBorder border() => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(32),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          prefixIcon: prefixIcon,
          errorStyle: const TextStyle(fontSize: 11, fontFamily: FontFamily.poppins),
          constraints: const BoxConstraints(),
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),
          hintStyle: BaseText(text: '', size: 15, color: hintColor ?? FoodDeliveryColors.gray1, fontWeight: FontWeight.w400).style,
          contentPadding: SizeHelper.padding(l: 16, r: 16, t: 10, b: 10),
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
