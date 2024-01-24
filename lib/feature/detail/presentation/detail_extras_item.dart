import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/application/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/order_times_buttons.dart';
import 'package:gen/gen.dart';

class DetailExtrasItem extends StatelessWidget {
  const DetailExtrasItem({super.key, required this.foodDetailViewModel, required this.extras});

  final FoodDetailViewModel foodDetailViewModel;
  final String extras;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SizeHelper.padding(t: 16, b: 16, l: 20, r: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: FoodDeliveryColors.gray1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFoodDelivery(
              text: extras,
              size: 18,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
            ),
          ),
          OrderTimesButtons(
            onDecrease: () {
              foodDetailViewModel.decreaseExtra(extras);
            },
            onIncrease: () {
              foodDetailViewModel.increaseExtra(extras);
            },
            text: foodDetailViewModel.selectedExtras![extras].toString(),
          )
        ],
      ),
    );
  }
}
