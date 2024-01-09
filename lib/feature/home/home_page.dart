import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/widget/category_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/featured_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/hotspot_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/search_text_field.dart';
import 'package:food_delivery_flutter/project/enum/food_category.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'featured/featured_section.dart';
part 'hotspots/hotspot_section.dart';

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
            const _FeaturedSection(),
            SizedBox(height: SizeHelper.toHeight(16)),
            const _HotspotSection(),
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
        separatorBuilder: (context, index) => SizedBox(width: SizeHelper.toWidth(24)),
        itemCount: FoodCategory.values.length,
      ),
    );
  }

  Padding searchSuperFoodo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SearchTextField(),
    );
  }
}
