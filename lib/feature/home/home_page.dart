import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/widget/category_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/featured_item.dart';
import 'package:food_delivery_flutter/project/enum/food_category.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text_field.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeHelper.toHeight(20)),
            searchSuperFoodo(),
            categoriesListView(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: SizeHelper.padding(l: 20, r: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextFoodDelivery(
                          text: 'Featured on Super Foodo',
                          size: 20,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      FoodDeliveryIconButton(
                        color: FoodDeliveryColors.gray4,
                        onTap: () {
                          context.push(AppNavigation.featuredDetailViewPath);
                        },
                        iconData: Icons.arrow_forward,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeHelper.toHeight(212),
                  child: Consumer<HomeViewViewModel>(
                    builder: (context, homeViewModel, _) => ListView.separated(
                      padding: SizeHelper.padding(l: 20, r: 20, t: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => FeaturedItem(
                        featuredModel: homeViewModel.featuredItems[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 24),
                      itemCount: homeViewModel.featuredItems.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox categoriesListView() {
    return SizedBox(
      height: SizeHelper.toHeight(140),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: SizeHelper.padding(l: 20, r: 20, b: 15, t: 24),
        itemBuilder: (context, index) => CategoryItem(foodCategory: FoodCategory.values[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 24),
        itemCount: FoodCategory.values.length,
      ),
    );
  }

  Padding searchSuperFoodo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FoodDeliveryTextField(
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
      ),
    );
  }
}
