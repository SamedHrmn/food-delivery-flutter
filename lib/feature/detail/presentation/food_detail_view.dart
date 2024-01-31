import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/presentation/detail_extras_item.dart';
import 'package:food_delivery_flutter/feature/detail/application/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/feature/shared/domain/food_model.dart';
import 'package:food_delivery_flutter/project/constant/string_constant.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_button.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_favourite_button.dart';
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
      context.read<FoodDetailViewModel>().initExtrasForSelectedFood(widget.foodModel);
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
              background(),
              Positioned.fill(
                child: Container(
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
                        child: foodImage(),
                      ),
                      Padding(
                        padding: SizeHelper.padding(t: 100),
                        child: Column(
                          children: [
                            TextFoodDelivery(text: widget.foodModel.name ?? '', size: 26),
                            detailInfos(),
                            TextFoodDelivery(text: '\$${widget.foodModel.price?.toString() ?? '-'}', size: 28),
                            extrasList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: SizeHelper.toHeight(16),
                left: SizeHelper.toWidth(20),
                right: SizeHelper.toWidth(20),
                child: backButton(context),
              ),
              Positioned(
                left: SizeHelper.toWidth(20),
                right: SizeHelper.toWidth(20),
                bottom: SizeHelper.toHeight(16),
                child: addToCartButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FoodDeliveryImage foodImage() {
    return FoodDeliveryImage(
      pathOrUrl: widget.foodModel.imagePath ?? '',
      height: 200,
    );
  }

  Padding detailInfos() {
    return Padding(
      padding: SizeHelper.padding(l: 64, r: 64, t: 16, b: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailInformationItem(iconPath: Assets.images.icDuration.path, text: '${widget.foodModel.duration ?? '-'} ${StringConstant.min}'),
          DetailInformationItem(iconPath: Assets.images.icRating.path, text: '${widget.foodModel.rating ?? '-'}'),
          DetailInformationItem(iconPath: Assets.images.icCalorie.path, text: '${widget.foodModel.cal?.toStringAsFixed(0) ?? '-'} ${StringConstant.cal}'),
        ],
      ),
    );
  }

  Padding extrasList() {
    return Padding(
      padding: SizeHelper.padding(t: 32, b: 7),
      child: Consumer<FoodDetailViewModel>(
        builder: (context, foodDetailViewModel, _) {
          if (!foodDetailViewModel.extrasInitialized || foodDetailViewModel.selectedExtras == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (foodDetailViewModel.selectedExtras!.isEmpty) {
            return TextFoodDelivery(text: '${StringConstant.noExtras} ${widget.foodModel.name}', size: 18);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: SizeHelper.padding(l: 20, r: 20),
                child: TextFoodDelivery(text: '${widget.foodModel.name ?? '-'} ${StringConstant.comesWith}', size: 20),
              ),
              ListView.builder(
                itemCount: foodDetailViewModel.selectedExtras!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => DetailExtrasItem(
                  foodDetailViewModel: foodDetailViewModel,
                  extras: foodDetailViewModel.selectedExtras!.keys.toList()[index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FoodDeliveryButton addToCartButton(BuildContext context) {
    return FoodDeliveryButton(
      text: StringConstant.addToCart,
      onPressed: () => context.push(AppNavigation.cartViewPath, extra: widget.foodModel),
    );
  }

  SizedBox backButton(BuildContext context) {
    return SizedBox(
      height: SizeHelper.toHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FoodDeliveryIconButton(
            onTap: () => context.pop(),
            iconData: Icons.arrow_back_outlined,
            size: 24,
          ),
          FoodDeliveryFavouriteButton(model: widget.foodModel),
        ],
      ),
    );
  }

  ColoredBox background() {
    return ColoredBox(
      color: const Color(0xfffbdb3f),
      child: FoodDeliveryImage(
        pathOrUrl: Assets.images.imFoodDetailBg.path,
        color: const Color(0xffec9e00),
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
        FoodDeliveryImage(
          pathOrUrl: iconPath,
          width: 20,
          height: 20,
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
