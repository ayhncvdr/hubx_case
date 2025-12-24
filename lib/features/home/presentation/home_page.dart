import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:hubx_case/shared/widgets/plant_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: PlantText('Loading...'));
        }

        if (state.error != null) {
          return Center(child: PlantText('Error: ${state.error}'));
        }

        // Success screen - for now just show placeholder
        return Center(
          child: PlantText(
            'Success!\nCategories: ${state.categories.length}\nQuestions: ${state.questions.length}',
          ),
        );
      },
    );
  }
}
