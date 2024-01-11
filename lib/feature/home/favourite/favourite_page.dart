import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/home/favourite/favourite_viewmodel.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_favourite_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeHelper.toHeight(40),
            child: const TextFoodDelivery(text: 'Favourites', size: 22),
          ),
          Consumer<FavouriteViewModel>(builder: (context, favouritesViewModel, _) {
            if (favouritesViewModel.favouritesAllLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (favouritesViewModel.favouritesAll.isEmpty) {
              return const TextFoodDelivery(
                text: 'There is no favourites',
                size: 20,
                fontWeight: FontWeight.w400,
              );
            }

            final favourites = favouritesViewModel.favouritesAll;

            return ListView.separated(
              padding: SizeHelper.padding(l: 20, r: 20, t: 40),
              shrinkWrap: true,
              itemBuilder: (context, index) => SizedBox(
                height: SizeHelper.toHeight(240),
                child: FavouriteItem(
                  foodModel: favourites[index],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: SizeHelper.toHeight(24),
              ),
              itemCount: favourites.length,
            );
          })
        ],
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  foodModel.imagePath ?? '',
                  package: 'gen',
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Placeholder(),
                ),
              ),
              Positioned(
                right: SizeHelper.toWidth(10),
                top: SizeHelper.toHeight(10),
                child: FoodDeliveryFavouriteButton(model: foodModel),
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeHelper.toHeight(10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFoodDelivery(text: foodModel.name ?? '', size: 16, fontWeight: FontWeight.w500),
                TextFoodDelivery(
                  text: '\$${foodModel.deliveryFee?.toString() ?? ''} Delivery Fee.${foodModel.duration ?? ''} min',
                  size: 11,
                  fontWeight: FontWeight.w400,
                  color: FoodDeliveryColors.black1.withOpacity(0.6),
                ),
              ],
            ),
            Container(
              width: SizeHelper.toWidth(32),
              height: SizeHelper.toHeight(27),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: FoodDeliveryColors.gray4),
              alignment: Alignment.center,
              child: TextFoodDelivery(
                text: foodModel.rating?.toString() ?? '',
                size: 11,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }
}
