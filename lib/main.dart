import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/application/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/cart/application/cart_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/favourite/application/favourite_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/hotspots/application/hotspot_viewmodel.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:food_delivery_flutter/project/navigation/app_navigation.dart';
import 'package:food_delivery_flutter/project/util/splash_helper.dart';
import 'package:provider/provider.dart';

void main() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  SplashScreenHelper.initSplash(binding: binding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => SplashScreenHelper.removeSplash(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FoodDetailViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriteViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HotspotViewModel(homeViewViewModel: context.read<HomeViewViewModel>()),
        ),
      ],
      child: MaterialApp.router(
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
