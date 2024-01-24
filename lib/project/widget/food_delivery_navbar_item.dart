import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:gen/gen.dart';
import 'package:provider/provider.dart';

class FoodDeliveryNavBarItem extends StatelessWidget {
  const FoodDeliveryNavBarItem({super.key, required this.iconPath, required this.page});

  final String iconPath;
  final NavbarPages page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FoodDeliveryIconButton.image(
          onTap: () {
            context.read<HomeViewViewModel>().toNavbarPage(page);
          },
          iconPath: iconPath,
          size: 22,
          padding: 8,
        ),
        Selector<HomeViewViewModel, int>(
          selector: (p0, p1) => p1.pageIndex,
          builder: (context, pageIndex, _) => Container(
            width: 7,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pageIndex == page.index ? FoodDeliveryColors.yellow1 : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
