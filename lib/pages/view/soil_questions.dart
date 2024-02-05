import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilQuestions extends StackedHookView<FarmViewModel> {
  const SoilQuestions({super.key});

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    var questions = model.questions;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Soil Property',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xff4C586F),
          ),
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < questions.length; i++)
          SoilPropertyContainer(
            question: questions[i],
            selectedOption: model.farAnswers[questions[i].id] ?? "",
            onOptionSelected: (option) {
              model.farAnswers[questions[i].id]= option ?? "";
              model.setFarmAnswers(model.farAnswers);
            },
          ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
