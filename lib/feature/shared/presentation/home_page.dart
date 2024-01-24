import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/featured/presentation/featured_section.dart';
import 'package:food_delivery_flutter/feature/home/hotspots/presentation/hotspot_section.dart';
import 'package:food_delivery_flutter/feature/home/widget/category_item.dart';
import 'package:food_delivery_flutter/feature/home/widget/search_text_field.dart';
import 'package:food_delivery_flutter/project/enum/food_category.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';

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
            const FeaturedSection(),
            SizedBox(height: SizeHelper.toHeight(16)),
            const HotspotSection(),
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
