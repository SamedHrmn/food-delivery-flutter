import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
