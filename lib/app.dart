import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hubx_case/core/routing/app_router.dart';
import 'package:hubx_case/core/theme/plant_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  GoRouter get _router => AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlantApp',
      theme: PlantTheme.light,
      routerConfig: _router,
    );
  }
}
