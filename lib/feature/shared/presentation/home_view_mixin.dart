import 'package:flutter/material.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view.dart';
import 'package:food_delivery_flutter/feature/shared/presentation/home_view_viewmodel.dart';
import 'package:provider/provider.dart';

mixin HomeViewMixin on State<HomeView> {
  final pageController = PageController();
  int pageIndex = 0;

  void updatePageIndex(int i) {
    setState(() {
      pageIndex = i;
    });
    context.read<HomeViewViewModel>().updatePageIndex(pageIndex);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeViewViewModel>().initializePageController(pageController);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
