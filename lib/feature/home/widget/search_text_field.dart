import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:gen/gen.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onChanged,
  });

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return FoodDeliveryTextField(
      onChanged: onChanged,
      hintText: StringConstant.searchHintText,
      hintColor: FoodDeliveryColors.black1.withOpacity(0.6),
      prefixIcon: InkWell(
        customBorder: const CircleBorder(),
        child: Padding(
          padding: SizeHelper.padding(
            l: 21,
            r: 16,
            t: 10,
            b: 10,
          ),
          child: FoodDeliveryAssetImage(
            assetPath: Assets.images.icSearch.path,
            width: 24,
          ),
        ),
      ),
    );
  }
}
