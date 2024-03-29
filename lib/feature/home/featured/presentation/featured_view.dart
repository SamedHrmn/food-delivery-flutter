import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/data/api_response.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/widget/featured_item.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FeaturedView extends StatefulWidget {
  const FeaturedView({super.key});

  @override
  State<FeaturedView> createState() => _FeaturedViewState();
}

class _FeaturedViewState extends State<FeaturedView> {
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
                      child: TextFoodDelivery(text: StringConstant.featured, size: 22),
                    ),
                    SizedBox(
                      width: SizeHelper.toWidth(29),
                      height: SizeHelper.toHeight(29),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<HomeViewViewModel>(
                builder: (context, homeViewModel, _) {
                  switch (homeViewModel.featuredItemsResponse.status) {
                    case ApiStatus.LOADING:
                      return const CircularProgressIndicator.adaptive();
                    case ApiStatus.ERROR:
                      return const TextFoodDelivery(text: StringConstant.errorMsg, size: 16);
                    case ApiStatus.COMPLETED:
                      final featuredItems = homeViewModel.featuredItemsResponse.data!;

                      return ListView.separated(
                          padding: SizeHelper.padding(l: 20, r: 20, t: 36),
                          itemBuilder: (context, index) => SizedBox(
                                height: SizeHelper.toHeight(260),
                                child: FeaturedItem(
                                  onTap: () => context.push(AppNavigation.foodDetailViewPath, extra: featuredItems[index]),
                                  featuredModel: featuredItems[index],
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: SizeHelper.toHeight(36),
                              ),
                          itemCount: featuredItems.length);

                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
