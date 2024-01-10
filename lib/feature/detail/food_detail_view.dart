import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/detail_extras_item.dart';
import 'package:food_delivery_flutter/feature/detail/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/domain/food_model.dart';
import 'package:food_delivery_flutter/feature/home/favourite/favourite_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_icon_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_text.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FoodDetailView extends StatefulWidget {
  const FoodDetailView({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FoodDetailViewModel>().initExtasForSelectedFood(widget.foodModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height - MediaQuery.viewPaddingOf(context).top,
              ),
              ColoredBox(
                color: const Color(0xfffbdb3f),
                child: Image.asset(
                  Assets.images.imFoodDetailBg.path,
                  package: 'gen',
                  color: const Color(0xffec9e00),
                ),
              ),
              Container(
                margin: SizeHelper.padding(t: 220),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -SizeHelper.toHeight(100),
                      child: Image.asset(
                        widget.foodModel.imagePath ?? '',
                        height: SizeHelper.toHeight(200),
                        errorBuilder: (context, error, stackTrace) => const Placeholder(),
                        package: 'gen',
                      ),
                    ),
                    Padding(
                      padding: SizeHelper.padding(t: 100),
                      child: Column(
                        children: [
                          TextFoodDelivery(text: widget.foodModel.name ?? '', size: 26),
                          Padding(
                            padding: SizeHelper.padding(l: 64, r: 64, t: 16, b: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DetailInformationItem(iconPath: Assets.images.icDuration.path, text: '${widget.foodModel.duration ?? '-'} Min'),
                                DetailInformationItem(iconPath: Assets.images.icRating.path, text: '${widget.foodModel.rating ?? '-'}'),
                                DetailInformationItem(iconPath: Assets.images.icCalorie.path, text: '${widget.foodModel.cal?.toStringAsFixed(0) ?? '-'} cal'),
                              ],
                            ),
                          ),
                          TextFoodDelivery(text: '\$${widget.foodModel.price?.toString() ?? '-'}', size: 28),
                          Padding(
                            padding: SizeHelper.padding(t: 32, b: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: SizeHelper.padding(l: 20, r: 20),
                                  child: TextFoodDelivery(text: '${widget.foodModel.name ?? '-'} Comes With', size: 20),
                                ),
                                Consumer<FoodDetailViewModel>(
                                  builder: (context, foodDetailViewModel, _) {
                                    if (!foodDetailViewModel.extasInitialized || foodDetailViewModel.selectedExtras == null) {
                                      return const Center(child: CircularProgressIndicator.adaptive());
                                    } else if (foodDetailViewModel.selectedExtras!.isEmpty) {
                                      return TextFoodDelivery(text: 'There is no extras for ${widget.foodModel.name}', size: 20);
                                    }

                                    return ListView.builder(
                                      itemCount: foodDetailViewModel.selectedExtras!.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) => DetailExtrasItem(
                                        foodDetailViewModel: foodDetailViewModel,
                                        extras: foodDetailViewModel.selectedExtras!.keys.toList()[index],
                                      ),
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
              ),
              Positioned(
                top: SizeHelper.toHeight(16),
                left: SizeHelper.toWidth(20),
                right: SizeHelper.toWidth(20),
                child: SizedBox(
                  height: SizeHelper.toHeight(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodDeliveryIconButton(
                        onTap: () => context.pop(),
                        iconData: Icons.arrow_back_outlined,
                        size: 24,
                      ),
                      Consumer<HomeViewViewModel>(builder: (context, homeViewModel, _) {
                        final model = homeViewModel.getFoodModelInHotspots(widget.foodModel);

                        if (model == null) {
                          Future.microtask(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: TextFoodDelivery(
                                  text: 'An error occured',
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }

                        return FoodDeliveryIconButton(
                          onTap: () => context.read<FavouriteViewModel>().updateFoodFavorite(model),
                          iconData: homeViewModel.getFoodModelInHotspots(widget.foodModel)?.isFavourite == true ? Icons.favorite : Icons.favorite_outline,
                          size: 24,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: SizeHelper.toWidth(20),
                right: SizeHelper.toWidth(20),
                bottom: SizeHelper.toHeight(16),
                child: FoodDeliveryButton(
                  text: 'Add 1 to Cart',
                  onPressed: () => context.push(AppNavigation.cartViewPath, extra: widget.foodModel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailInformationItem extends StatelessWidget {
  const DetailInformationItem({
    super.key,
    required this.iconPath,
    required this.text,
  });

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconPath,
          package: 'gen',
          width: SizeHelper.toWidth(20),
          height: SizeHelper.toHeight(20),
        ),
        SizedBox(width: SizeHelper.toWidth(6)),
        TextFoodDelivery(
          text: text,
          size: 14,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
