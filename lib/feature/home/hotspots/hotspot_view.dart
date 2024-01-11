import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/widget/hotspot_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/search_text_field.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HotspotView extends StatelessWidget {
  const HotspotView({super.key});

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
                      child: TextFoodDelivery(text: 'Hotspots', size: 22),
                    ),
                    SizedBox(
                      width: SizeHelper.toWidth(29),
                      height: SizeHelper.toHeight(29),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: SizeHelper.padding(l: 20, r: 20, t: 22, b: 27),
              child: const SearchTextField(),
            ),
            Expanded(
              child: Consumer<HomeViewViewModel>(
                builder: (context, homeViewModel, _) => GridView.builder(
                  padding: SizeHelper.padding(l: 16, r: 16),
                  itemCount: homeViewModel.hotSpots.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeHelper.toWidth(40),
                    mainAxisSpacing: SizeHelper.toHeight(30),
                  ),
                  itemBuilder: (context, index) {
                    return HotspotItem(
                      onTap: () => context.push(AppNavigation.foodDetailViewPath, extra: homeViewModel.hotSpots[index]),
                      hotspotModel: homeViewModel.hotSpots[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
