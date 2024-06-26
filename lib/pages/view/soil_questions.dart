import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';
import 'package:masl_futa_agric/viewmodel/add_farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilQuestions extends StackedHookView<AddFarmViewModel> {
  const SoilQuestions({super.key});

  @override
  Widget builder(BuildContext context, AddFarmViewModel model) {
    var questions = model.questions;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          for (int i = 0; i < questions.length; i++)
            SoilPropertyContainer(
              question: questions[i],
              selectedOption: model.farAnswers[questions[i].id] ?? "",
              onOptionSelected: (option) {
                model.farAnswers[questions[i].id] = option ?? "";
                model.setFarmAnswers(model.farAnswers);
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
