import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/home/favourite/application/favourite_viewmodel.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:provider/provider.dart';

class FoodDeliveryFavouriteButton extends StatelessWidget {
  const FoodDeliveryFavouriteButton({super.key, required this.model});

  final FoodModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteViewModel>(
      builder: (context, favouriteViewModel, _) {
        return FoodDeliveryIconButton(
          onTap: () => context.read<FavouriteViewModel>().updateFoodFavorite(model),
          iconData: favouriteViewModel.isFavourite(model) ? Icons.favorite : Icons.favorite_outline,
          size: 24,
        );
      },
    );
  }
}
