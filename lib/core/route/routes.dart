import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login('/login'),
  splash('/splash'),
  buySellPortal('/buySellPortal'),
  salePortal('/salePortal'),
  futurePortal('/futurePortal');

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context) => context.go(path);

  void push(BuildContext context) => context.push(path);
}