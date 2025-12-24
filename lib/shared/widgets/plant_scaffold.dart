import 'package:flutter/material.dart';

class PlantScaffold extends StatelessWidget {
  const PlantScaffold({
    required this.body,
    this.useSafeArea = true,
    this.appBar,
    this.floatingActionButton,
    super.key,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: useSafeArea ? SafeArea(child: body) : body,
      floatingActionButton: floatingActionButton,
    );
  }
}
