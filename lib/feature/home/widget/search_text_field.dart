import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:gen/gen.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodDeliveryTextField(
      hintText: 'Search Super Foodo',
      hintColor: FoodDeliveryColors.black1.withOpacity(0.6),
      prefixIcon: InkWell(
        onTap: () {},
        customBorder: const CircleBorder(),
        child: Padding(
          padding: SizeHelper.padding(
            l: 21,
            r: 16,
            t: 10,
            b: 10,
          ),
          child: Image.asset(
            Assets.images.icSearch.path,
            width: SizeHelper.toWidth(24),
            package: 'gen',
          ),
        ),
      ),
    );
  }
}
