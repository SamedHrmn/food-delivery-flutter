import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/cart/application/cart_viewmodel.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/order_times_buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            Expanded(
              child: Padding(
                padding: SizeHelper.padding(l: 20, r: 20, t: 32, b: 32),
                child: Column(
                  children: [
                    nameAndImage(),
                    SizedBox(
                      height: SizeHelper.toHeight(32),
                    ),
                    orderCounter(),
                    SizedBox(
                      height: SizeHelper.toHeight(64),
                    ),
                    subTotal(),
                    const Spacer(),
                    goToCheckouts(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding goToCheckouts(BuildContext context) {
    return Padding(
      padding: SizeHelper.padding(b: MediaQuery.paddingOf(context).bottom > 0 ? 0 : 32),
      child: FoodDeliveryButton(
        text: StringConstant.goToCheckouts,
        onPressed: () {},
      ),
    );
  }

  Row subTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextFoodDelivery(
          text: StringConstant.subTotal,
          size: 20,
          fontWeight: FontWeight.w500,
        ),
        Consumer<CartViewModel>(builder: (context, cartViewModel, _) {
          if (foodModel.price == null) return const SizedBox();

          return TextFoodDelivery(
            text: '\$${foodModel.price! * cartViewModel.orderCount}',
            size: 20,
            fontWeight: FontWeight.w500,
          );
        }),
      ],
    );
  }

  Row orderCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<CartViewModel>(builder: (context, cartViewModel, _) {
          return OrderTimesButtons(
            onDecrease: () {
              cartViewModel.decreaseOrder();
            },
            onIncrease: () {
              cartViewModel.increaseOrder();
            },
            text: cartViewModel.orderCount.toString(),
            decreaseIcon: Icons.delete,
          );
        }),
        TextFoodDelivery(
          text: '\$${foodModel.price?.toString() ?? '-'}',
          size: 18,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Row nameAndImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFoodDelivery(text: foodModel.name ?? '-', size: 26),
        FoodDeliveryImage(
          pathOrUrl: foodModel.imagePath ?? '-',
          width: 70,
        ),
      ],
    );
  }

  SizedBox appBar(BuildContext context) {
    return SizedBox(
      height: SizeHelper.toHeight(40),
      child: FoodDeliveryIconButton(
        onTap: () => context.pop(),
        iconData: Icons.close,
        padding: 20,
        size: 24,
      ),
    );
  }
}
