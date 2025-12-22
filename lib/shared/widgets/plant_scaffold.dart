import 'package:flutter/material.dart';

class PlantScaffold extends StatelessWidget {
  const PlantScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
