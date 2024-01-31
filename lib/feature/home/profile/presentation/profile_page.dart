import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_flutter/feature/home/profile/application/profile_view_model.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
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
              child: FoodDeliveryImage(pathOrUrl: Assets.images.icAccount.path),
            ),
          ),
          Expanded(
            child: Padding(
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<ProfileViewModel>(
                            builder: (context, profileViewModel, _) => Row(
                              children: [
                                const Expanded(
                                  child: TextFoodDelivery(
                                    text: StringConstant.yourCards,
                                    textAlign: TextAlign.start,
                                    size: 18,
                                  ),
                                ),
                                if (profileViewModel.foodUser.creditCards?.isNotEmpty == true) ...{
                                  FoodDeliveryIconButton(
                                    onTap: () => context.push(AppNavigation.addCardViewPath),
                                    color: FoodDeliveryColors.yellow1,
                                    iconData: Icons.add,
                                  ),
                                }
                              ],
                            ),
                          ),
                          Flexible(
                            child: Consumer<ProfileViewModel>(
                              builder: (context, profileViewModel, child) {
                                if (profileViewModel.foodUser.creditCards == null) return const SizedBox();
                                if (profileViewModel.foodUser.creditCards?.isEmpty == true) {
                                  return Container(
                                    margin: SizeHelper.padding(t: 16),
                                    padding: SizeHelper.padding(t: 32, b: 32),
                                    height: SizeHelper.toHeight(130),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: FoodDeliveryColors.gray1),
                                    ),
                                    child: FoodDeliveryIconButton(
                                      iconData: Icons.add,
                                      color: FoodDeliveryColors.yellow1,
                                      size: 40,
                                      onTap: () => context.push(AppNavigation.addCardViewPath),
                                    ),
                                  );
                                }

                                final cards = profileViewModel.foodUser.creditCards!;

                                return ListView.separated(
                                    padding: SizeHelper.padding(t: 16),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => CreditCardWidget(
                                          cardNumber: cards[index].cardNumber!,
                                          expiryDate: cards[index].expDate!,
                                          cardHolderName: cards[index].name!,
                                          cvvCode: cards[index].cvv!.toString(),
                                          showBackView: false,
                                          padding: 0,
                                          isHolderNameVisible: true,
                                          height: SizeHelper.toHeight(220),
                                          onCreditCardWidgetChange: (p0) {},
                                        ),
                                    separatorBuilder: (context, index) => SizedBox(
                                          height: SizeHelper.toHeight(8),
                                        ),
                                    itemCount: cards.length);
                              },
                            ),
                          ),
                          SizedBox(
                            height: SizeHelper.toHeight(96),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
