import 'package:flutter/material.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: Center(child: PlantText('${L.home.errorPrefix}$error')),
    );
  }
}
