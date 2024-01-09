part of '../home_page.dart';

class _FeaturedSection extends StatelessWidget {
  const _FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SizeHelper.padding(l: 20, r: 20),
          child: Row(
            children: [
              const Expanded(
                child: TextFoodDelivery(
                  text: 'Featured on Super Foodo',
                  size: 20,
                  textAlign: TextAlign.start,
                ),
              ),
              FoodDeliveryIconButton(
                color: FoodDeliveryColors.gray4,
                onTap: () {
                  context.push(AppNavigation.featuredViewPath);
                },
                iconData: Icons.arrow_forward,
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeHelper.toHeight(212),
          child: Consumer<HomeViewViewModel>(
            builder: (context, homeViewModel, _) => ListView.separated(
              padding: SizeHelper.padding(l: 20, r: 20, t: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FeaturedItem(
                featuredModel: homeViewModel.featuredItems[index],
              ),
              separatorBuilder: (context, index) => SizedBox(width: SizeHelper.toWidth(24)),
              itemCount: homeViewModel.featuredItems.length,
            ),
          ),
        ),
      ],
    );
  }
}
