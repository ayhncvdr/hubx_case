import 'package:flutter/material.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class MyGardenPage extends StatelessWidget {
  const MyGardenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlantScaffold(
      body: Center(child: PlantText('My Garden')),
    );
  }
}
