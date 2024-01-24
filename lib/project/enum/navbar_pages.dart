import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/home/favourite/presentation/favourite_page.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_page.dart';
import 'package:food_delivery_flutter/feature/home/hotspots/presentation/hotspot_page.dart';
import 'package:food_delivery_flutter/feature/home/profile/presentation/profile_page.dart';

enum NavbarPages {
  home,
  hotspot,
  favourite,
  profile;

  const NavbarPages();

  Widget toPage() {
    switch (this) {
      case NavbarPages.home:
        return const HomePage();
      case NavbarPages.hotspot:
        return const HotspotPage();
      case NavbarPages.favourite:
        return const FavouritePage();
      case NavbarPages.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
