import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/detail/food_detail_viewmodel.dart';
import 'package:food_delivery_flutter/feature/home/home_view_viewmodel.dart';
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
      ],
      child: MaterialApp.router(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
