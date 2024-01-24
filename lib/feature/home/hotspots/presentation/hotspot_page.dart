import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_flutter/feature/home/hotspots/application/hotspot_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/widget/hotspot_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/search_text_field.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HotspotPage extends StatefulWidget {
  const HotspotPage({super.key});

  @override
  State<HotspotPage> createState() => _HotspotPageState();
}

class _HotspotPageState extends State<HotspotPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeHelper.toHeight(50),
            child: Padding(
              padding: SizeHelper.padding(l: 20, r: 20),
              child: const TextFoodDelivery(text: StringConstant.hotspots, size: 22),
            ),
          ),
          Padding(
            padding: SizeHelper.padding(l: 20, r: 20, t: 22, b: 27),
            child: SearchTextField(
              onChanged: (p0) {
                context.read<HotspotViewModel>().updateSearchItems(p0 ?? '');
              },
            ),
          ),
          Expanded(
            child: Consumer<HotspotViewModel>(
              builder: (context, hotspotViewModel, _) => AnimationLimiter(
                child: GridView.builder(
                  padding: SizeHelper.padding(l: 16, r: 16),
                  itemCount: hotspotViewModel.searchItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeHelper.toWidth(40),
                    mainAxisSpacing: SizeHelper.toHeight(30),
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: (hotspotViewModel.searchItems.length / 2).floor(),
                      child: ScaleAnimation(
                        child: HotspotItem(
                          onTap: () => context.push(AppNavigation.foodDetailViewPath, extra: hotspotViewModel.searchItems[index]),
                          hotspotModel: hotspotViewModel.searchItems[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
