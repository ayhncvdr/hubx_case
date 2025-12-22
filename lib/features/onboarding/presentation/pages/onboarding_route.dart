import 'package:flutter/material.dart';
import 'package:hubx_case/core/theme/plant_spacing.dart';
import 'package:hubx_case/shared/widgets/plant_scaffold.dart';

class OnboardingRoute extends StatelessWidget {
  const OnboardingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: const Padding(
        padding: EdgeInsets.all(PlantSpacing.x20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: SizedBox.expand(),
              ),
            ),
            SizedBox(height: PlantSpacing.x20),
          ],
        ),
      ),
    );
  }
}
