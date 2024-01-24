import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_mixin.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_bottom_navbar.dart';
import 'package:gen/gen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodDeliveryColors.gray3,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: NavbarPages.values.length,
              itemBuilder: (context, index) => NavbarPages.values[index].toPage(),
              onPageChanged: updatePageIndex,
            ),
          ),
          Positioned(
            height: SizeHelper.toHeight(82),
            bottom: 0,
            left: 0,
            right: 0,
            child: const FoodDeliveryBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
