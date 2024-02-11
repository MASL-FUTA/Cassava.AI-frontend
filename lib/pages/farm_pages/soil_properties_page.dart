import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_page.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/pages/view/soil_questions.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilPropertyPage extends StackedHookView<FarmViewModel> {
  final PageController pageController;

  const SoilPropertyPage({super.key, required this.pageController});

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: defaultLeadingWidth + 16,
        leading: AppBackButton(
          func: () => pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Soil Property',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xff4C586F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SoilQuestions(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 56,
                  width: 331,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff026742),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      model.saveFarmDetails(context);
                    },
                    child: const Text(
                      'Create Farm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoilPropertyContainer extends StackedHookView<FarmViewModel> {
  final Question question;
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;

  SoilPropertyContainer({
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget builder(BuildContext context, FarmViewModel model) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF7988A4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7988A4)),
          ),
          const SizedBox(height: 10),
          for (String option in question.options)
            InkWell(
              onTap: () => onOptionSelected(option),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Radio(
                      value: option,
                      groupValue: model.farAnswers[question.id],
                      onChanged: (value) => onOptionSelected(value),
                      activeColor: const Color(0xFF026742),
                    ),
                    Text(
                      option,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF026742),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Question {
  final String id;
  final String question;
  final List<String> options;

  Question({required this.question, required this.options, required this.id});
}
