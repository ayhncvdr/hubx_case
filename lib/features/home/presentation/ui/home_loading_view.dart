import 'package:flutter/material.dart';
import 'package:hubx_case/loc_generated/l.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: Center(child: PlantText(L.home.loading)),
    );
  }
}
