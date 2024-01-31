import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/project/enum/navbar_pages.dart';
import 'package:food_delivery_flutter/project/util/size_helper.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_image.dart';
import 'package:food_delivery_flutter/project/widget/food_delivery_navbar_item.dart';
import 'package:gen/gen.dart';

class FoodDeliveryBottomNavBar extends StatelessWidget {
  const FoodDeliveryBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.maxFinite, SizeHelper.toHeight(82)),
      painter: _NavbarPainter(),
      child: Padding(
        padding: EdgeInsets.only(left: SizeHelper.toWidth(28), right: SizeHelper.toWidth(28), top: 8),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                FoodDeliveryNavBarItem(iconPath: Assets.images.icHome.path, page: NavbarPages.home),
                const Spacer(flex: 2),
                FoodDeliveryNavBarItem(iconPath: Assets.images.icSearch.path, page: NavbarPages.hotspot),
                const Spacer(flex: 5),
                FoodDeliveryNavBarItem(iconPath: Assets.images.icFav.path, page: NavbarPages.favourite),
                const Spacer(flex: 2),
                FoodDeliveryNavBarItem(iconPath: Assets.images.icAccount.path, page: NavbarPages.profile),
              ],
            ),
            Positioned(
              width: SizeHelper.toWidth(62),
              top: SizeHelper.toHeight(-24),
              height: SizeHelper.toHeight(62),
              child: Material(
                elevation: 8,
                shape: const CircleBorder(),
                color: FoodDeliveryColors.yellow1,
                child: InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FoodDeliveryImage(
                      pathOrUrl: Assets.images.icBag.path,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavbarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.25, size.height * 0.14);
    path.lineTo(size.width * 0.49, size.height * 0.05);
    path.lineTo(size.width * 0.74, size.height * 0.14);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.2);
    path.close();

    Paint shadowPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

    canvas.drawPath(path, shadowPaint);

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
