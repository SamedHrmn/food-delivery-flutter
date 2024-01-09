import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
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
          Container(
            padding: SizeHelper.padding(l: 6, r: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: FoodDeliveryColors.yellow1,
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      foodDetailViewModel.decreaseExtra(extras);
                    },
                    icon: Icon(Icons.remove)),
                /*FoodDeliveryIconButton(
                    onTap: () {
                      foodDetailViewModel.decreaseExtra(extras);
                    },
                    iconData: Icons.remove,
                    size: 20,
                    color: FoodDeliveryColors.yellow1),*/
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  alignment: Alignment.center,
                  margin: SizeHelper.padding(l: 4, r: 4),
                  padding: SizeHelper.padding(all: 6),
                  child: TextFoodDelivery(
                    text: foodDetailViewModel.selectedExtras![extras].toString(),
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FoodDeliveryIconButton(
                  onTap: () {
                    foodDetailViewModel.increaseExtra(extras);
                  },
                  iconData: Icons.add,
                  size: 20,
                  color: FoodDeliveryColors.yellow1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
