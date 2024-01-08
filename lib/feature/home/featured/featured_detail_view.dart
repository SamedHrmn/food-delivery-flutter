import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:go_router/go_router.dart';

class FeaturedDetailView extends StatefulWidget {
  const FeaturedDetailView({super.key});

  @override
  State<FeaturedDetailView> createState() => _FeaturedDetailViewState();
}

class _FeaturedDetailViewState extends State<FeaturedDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: SizeHelper.toHeight(50),
              child: Padding(
                padding: SizeHelper.padding(l: 20, r: 20),
                child: Row(
                  children: [
                    FoodDeliveryIconButton(
                      onTap: () => context.pop(),
                      iconData: Icons.arrow_back_outlined,
                      size: 29,
                    ),
                    const Expanded(
                      child: TextFoodDelivery(text: 'Featured', size: 22),
                    ),
                    SizedBox(
                      width: SizeHelper.toWidth(29),
                      height: SizeHelper.toHeight(29),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
