import 'package:gen/gen.dart';

enum FoodCategory {
  burgers,
  pizza,
  meat,
  iceCream;

  const FoodCategory();

  String iconPath() {
    switch (this) {
      case FoodCategory.burgers:
        return Assets.images.icBurger.path;
      case FoodCategory.pizza:
        return Assets.images.icPizza.path;
      case FoodCategory.meat:
        return Assets.images.icMeat.path;
      case FoodCategory.iceCream:
        return Assets.images.icIceCream.path;
    }
  }

  String text() {
    switch (this) {
      case FoodCategory.burgers:
        return 'Burgers';
      case FoodCategory.pizza:
        return 'Pizza';
      case FoodCategory.meat:
        return 'Meat';
      case FoodCategory.iceCream:
        return 'IceCream';
    }
  }
}
