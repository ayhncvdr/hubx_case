import 'package:flutter/material.dart';
import 'package:hubx_case/shared/styles/plant_text_styles.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      body: Center(
        child: PlantText(
          'Paywall (coming soon)',
          style: PlantTextStyles.title18Medium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
