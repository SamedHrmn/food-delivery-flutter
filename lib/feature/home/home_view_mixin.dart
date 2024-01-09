import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/cart/cart_page.dart';
import 'package:food_delivery_flutter/feature/home/favourite/favourite_page.dart';
import 'package:food_delivery_flutter/feature/home/home_page.dart';
import 'package:food_delivery_flutter/feature/home/home_view.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/hotspots/hotspot_view.dart';
import 'package:food_delivery_flutter/feature/home/profile/profile_page.dart';
import 'package:provider/provider.dart';

mixin HomeViewMixin on State<HomeView> {
  final navbarPages = const [
    HomePage(),
    HotspotView(),
    CartPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  final pageController = PageController();
  int pageIndex = 0;

  void updatePageIndex(int i) {
    setState(() {
      pageIndex = i;
    });
    context.read<HomeViewViewModel>().updatePageIndex(pageIndex);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeViewViewModel>().pageController = pageController;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
