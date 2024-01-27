import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/profile/application/profile_view_model.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_asset_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeHelper.toHeight(16),
          ),
          CircleAvatar(
            radius: SizeHelper.toHeight(50),
            backgroundColor: FoodDeliveryColors.gray1,
            child: Padding(
              padding: SizeHelper.padding(all: 8),
              child: FoodDeliveryAssetImage(assetPath: Assets.images.icAccount.path),
            ),
          ),
          Padding(
            padding: SizeHelper.padding(l: 20, r: 20, t: 8),
            child: Column(
              children: [
                Selector<ProfileViewModel, String?>(
                  selector: (p0, p1) => p1.foodUser.email,
                  builder: (context, email, child) {
                    if (email == null) return const SizedBox();

                    return TextFoodDelivery(
                      text: email,
                      size: 16,
                    );
                  },
                ),
                SizedBox(
                  height: SizeHelper.toHeight(16),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFoodDelivery(
                        text: StringConstant.yourCards,
                        size: 18,
                      ),
                      Consumer<ProfileViewModel>(
                        builder: (context, profileViewModel, child) {
                          if (profileViewModel.foodUser.creditCards == null) return const SizedBox();
                          if (profileViewModel.foodUser.creditCards?.isEmpty == true) {
                            return Container(
                              margin: SizeHelper.padding(t: 16),
                              padding: SizeHelper.padding(t: 32, b: 32),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: FoodDeliveryColors.gray1),
                              ),
                              child: FoodDeliveryIconButton(
                                iconData: Icons.add,
                                color: FoodDeliveryColors.yellow1,
                                size: 40,
                                onTap: () => context.go(AppNavigation.addCardViewPath),
                              ),
                            );
                          }

                          final cards = profileViewModel.foodUser.creditCards!;

                          return SizedBox(
                            height: 200,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => SizedBox(),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: SizeHelper.toHeight(8),
                                    ),
                                itemCount: cards.length),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
