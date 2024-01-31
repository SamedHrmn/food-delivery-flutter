import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/widget/hotspot_item.dart';
import 'package:food_delivery_flutter/feature/shared/data/api_response.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/food_shimmer_loader.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HotspotSection extends StatelessWidget {
  const HotspotSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SizeHelper.padding(l: 20, r: 20),
          child: Row(
            children: [
              const Expanded(
                child: TextFoodDelivery(
                  text: StringConstant.hotspots,
                  size: 20,
                  textAlign: TextAlign.start,
                ),
              ),
              FoodDeliveryIconButton(
                color: FoodDeliveryColors.gray4,
                onTap: () {
                  context.read<HomeViewViewModel>().toNavbarPage(NavbarPages.hotspot);
                },
                iconData: Icons.arrow_forward,
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeHelper.toHeight(216),
          child: Consumer<HomeViewViewModel>(
            builder: (context, homeViewModel, _) {
              switch (homeViewModel.hotspotItemsResponse.status) {
                case ApiStatus.LOADING:
                  return ListView.separated(
                    padding: SizeHelper.padding(l: 20, r: 20, t: 16, b: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FoodShimmerLoader(child: HotspotItem.loading()),
                    separatorBuilder: (context, index) => SizedBox(width: SizeHelper.toWidth(40)),
                    itemCount: 5,
                  );
                case ApiStatus.ERROR:
                  return const TextFoodDelivery(text: StringConstant.errorMsg, size: 16);
                case ApiStatus.COMPLETED:
                  final hotSpots = homeViewModel.hotspotItemsResponse.data!;

                  return ListView.separated(
                    padding: SizeHelper.padding(l: 20, r: 20, t: 16, b: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => HotspotItem(
                      onTap: () => context.push(AppNavigation.foodDetailViewPath, extra: hotSpots[index]),
                      hotspotModel: hotSpots[index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: SizeHelper.toWidth(40)),
                    itemCount: hotSpots.length,
                  );

                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
