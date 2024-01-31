import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/profile/application/profile_view_model.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_mixin.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_bottom_navbar.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.wait([
        context.read<HomeViewViewModel>().getFeaturedItems(),
        context.read<HomeViewViewModel>().getHotspotItems(),
      ]);
    });

    final user = context.read<ProfileViewModel>().foodUser;

    if (user.email != null) {
      Future.microtask(
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextFoodDelivery(
              text: 'Welcome ${user.email}',
              size: 14,
              color: FoodDeliveryColors.white1,
            ),
          ),
        ),
      );
    }
  }

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
