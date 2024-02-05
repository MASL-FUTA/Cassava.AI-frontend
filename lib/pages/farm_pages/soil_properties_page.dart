import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_page.dart';
import 'package:masl_futa_agric/pages/view/app_bar.dart';
import 'package:masl_futa_agric/pages/view/soil_questions.dart';
import 'package:masl_futa_agric/service/local_storage.dart';
import 'package:masl_futa_agric/viewmodel/farm_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SoilPropertyPage extends StatelessWidget {
  final PageController pageController;

  const SoilPropertyPage({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final defaultLeadingWidth = AppBarTheme.of(context).iconTheme?.size ?? 56.0;
    final Map<String, String?> selectedOptions = {
      'soilTexture': null,
      'soilMoisture': null,
      'drainage': null,
      'organicMatter': null,
      'salinity': null,
      'erosionStatus': null,
    };
    return Scaffold(
      appBar: AppBar(
        leadingWidth: defaultLeadingWidth + 16,
        leading: AppBackButton(
          func: () => Navigator.pop(context),
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
      body: Stack(
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
                  onPressed: () async {
                    try {
                      final farmDetailsState =
                          context.read<FarmDetailsBloc>().state;

                      // Get the selected options from the state
                      final selectedSoilTexture =
                          selectedOptions['soilTexture'];
                      final selectedSoilMoisture =
                          selectedOptions['soilMoisture'];
                      final selectedDrainage = selectedOptions['drainage'];
                      final selectedOrganicMatter =
                          selectedOptions['organicMatter'];
                      final selectedSalinity = selectedOptions['salinity'];
                      final selectedErosionStatus =
                          selectedOptions['erosionStatus'];

                      // Update the soilPropertyDetails
                      SoilPropertyDetails updatedSoilPropertyDetails =
                          SoilPropertyDetails(
                        soilTexture: selectedSoilTexture,
                        soilMoisture: selectedSoilMoisture,
                        drainage: selectedDrainage,
                        organicMatter: selectedOrganicMatter,
                        salinity: selectedSalinity,
                        erosionStatus: selectedErosionStatus,
                      );

                      final farmName = farmDetailsState.farmName;
                      final farmLocation = farmDetailsState.farmLocation;
                      final farmSize = farmDetailsState.farmSize;
                      final unit = farmDetailsState.unit;
                      final stage = farmDetailsState.stage;
                      final soilPH = farmDetailsState.soilPH;
                      final soilType = farmDetailsState.soilType;
                      final soilPropertyDetails =
                          farmDetailsState.soilPropertyDetails;

                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setString(
                          'selectedSoilTexture', selectedSoilTexture ?? '');
                      prefs.setString(
                          'selectedSoilMoisture', selectedSoilMoisture ?? '');
                      prefs.setString(
                          'selectedDrainage', selectedDrainage ?? '');
                      prefs.setString(
                          'selectedOrganicMatter', selectedOrganicMatter ?? '');
                      prefs.setString(
                          'selectedSalinity', selectedSalinity ?? '');
                      prefs.setString(
                          'selectedErosionStatus', selectedErosionStatus ?? '');

                      //_farmDetailsBloc.add(FetchFarms());

                      if (context.mounted) {
                        final farmListBloc = context.read<FarmListBloc>();
                        farmListBloc.add(FetchFarms());
                      }

                      var json = await LocalStorage().getString('farmDetails');
                      var farmDetails = FarmDetails.getData(jsonDecode(json));
                      farmDetails = farmDetails.copyWith(
                        farmName: farmName,
                        farmLocation: farmLocation,
                        farmSize: farmSize,
                        unit: unit,
                        stage: stage,
                        soilPH: soilPH,
                        soilType: soilType,
                        soilPropertyDetails: soilPropertyDetails,
                      );
                      if (json.isNotEmpty) return;
                      LocalStorage().setString(
                        'farmDetails',
                        jsonEncode(farmDetails.getMap()),
                      );
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FarmPage(farms: farmDetails),
                          ),
                        );
                      }
                    } catch (e) {
                      // Handle exceptions
                      debugPrint('Error: $e');
                    }
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
