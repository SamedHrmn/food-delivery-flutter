part of '../home_page.dart';

class _HotspotSection extends StatelessWidget {
  const _HotspotSection({super.key});

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
                  text: 'Hotspots',
                  size: 20,
                  textAlign: TextAlign.start,
                ),
              ),
              FoodDeliveryIconButton(
                color: FoodDeliveryColors.gray4,
                onTap: () {
                  context.push(AppNavigation.hotspotViewPath);
                },
                iconData: Icons.arrow_forward,
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeHelper.toHeight(216),
          child: Consumer<HomeViewViewModel>(
            builder: (context, homeViewModel, _) => ListView.separated(
              padding: SizeHelper.padding(l: 20, r: 20, t: 16, b: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HotspotItem(
                onTap: () => context.push(AppNavigation.foodDetailViewPath, extra: homeViewModel.hotspotItems[index]),
                hotspotModel: homeViewModel.hotspotItems[index],
              ),
              separatorBuilder: (context, index) => SizedBox(width: SizeHelper.toWidth(40)),
              itemCount: homeViewModel.hotspotItems.length,
            ),
          ),
        ),
      ],
    );
  }
}
