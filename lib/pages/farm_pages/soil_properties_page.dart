import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoilPropertyPage extends StatefulWidget {
  @override
  _SoilPropertyPageState createState() => _SoilPropertyPageState();
}

class _SoilPropertyPageState extends State<SoilPropertyPage> {
   final FarmDetailsBloc _farmDetailsBloc = FarmDetailsBloc();  

    SoilPropertyDetails soilPropertyDetails = SoilPropertyDetails(
    soilTexture: null,
    soilMoisture: null,
    drainage: null,
    organicMatter: null,
    salinity: null,
    erosionStatus: null,
  );

  final Map<String, String?> selectedOptions = {
    'soilTexture': null,
    'soilMoisture': null,
    'drainage': null,
    'organicMatter': null,
    'salinity': null,
    'erosionStatus': null,
  };


  final List<Question> questions = [
    Question(
      question: 'What is your soil texture?',
      options: ['Sandy', 'Clayey', 'Silt', 'Loamy'],
    ),
    Question(
      question: 'What is the soil moisture level?',
      options: ['Dry', 'Moist', 'Wet'],
    ),
    Question(
      question: 'How drained is your soil?',
      options: ['Well Drained', 'Poor Drained'],
    ),
    Question(
      question: 'What is the organic matter content of your soil?',
      options: ['Low', 'Medium', 'High'],
    ),
    Question(
      question: 'What is the salinity content of your soil?',
      options: ['Saline', 'Non-Saline'],
    ),
    Question(
      question: 'What is the erosion status of your soil?',
      options: ['Eroded', 'Non-Eroded'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _farmDetailsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Soil Property'),
        ),
        body: Stack(
          children:[ SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            
            child: Column(
              children: [
                 const Text('Soil Property',style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700,
              color: Color(0xff4C586F)
            ),),
             const SizedBox(height: 16),
                for (int i = 0; i < questions.length; i++)
                SoilPropertyContainer(
                  question: questions[i],
                  selectedOption: selectedOptions[questions[i].id],
                  onOptionSelected: (option) {
                    setState(() {
                      selectedOptions[questions[i].id] = option;
                    });
                  },
                ),
               const SizedBox(height: 20),
            
          ]),
          ),
              Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: SizedBox(
            height: 56,
            width: 331,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                      primary: const Color(0xff026742),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
   
    
    onPressed: () async {
  try {
    final farmDetailsState = context.read<FarmDetailsBloc>().state;

    // Get the selected options from the state
    final selectedSoilTexture = selectedOptions['soilTexture'];
    final selectedSoilMoisture = selectedOptions['soilMoisture'];
    final selectedDrainage = selectedOptions['drainage'];
    final selectedOrganicMatter = selectedOptions['organicMatter'];
    final selectedSalinity = selectedOptions['salinity'];
    final selectedErosionStatus = selectedOptions['erosionStatus'];

    // Update the soilPropertyDetails
    SoilPropertyDetails updatedSoilPropertyDetails = SoilPropertyDetails(
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
    final soilPropertyDetails = farmDetailsState.soilPropertyDetails;

    // Create Farm object with all details
    FarmDetails farm = FarmDetails(
      farmName: farmName,
      farmLocation: farmLocation,
      farmSize: farmSize,
      unit: unit,
      stage: stage,
      soilPH: soilPH,
      soilType: soilType,
      soilPropertyDetails: soilPropertyDetails,
    );

    debugPrint('create farm button clicked1');

    // Save data using SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('farmName', farmName);
    prefs.setString('farmLocation', farmLocation);
    prefs.setString('farmSize', farmSize);
    prefs.setString('unit', unit);
    prefs.setString('stage', stage);
    prefs.setString('soilPH', soilPH);
    prefs.setString('soilType', soilType);

    // Save soil property details
    prefs.setString('selectedSoilTexture', selectedSoilTexture ?? '');
    prefs.setString('selectedSoilMoisture', selectedSoilMoisture ?? '');
    prefs.setString('selectedDrainage', selectedDrainage ?? '');
    prefs.setString('selectedOrganicMatter', selectedOrganicMatter ?? '');
    prefs.setString('selectedSalinity', selectedSalinity ?? '');
    prefs.setString('selectedErosionStatus', selectedErosionStatus ?? '');

    debugPrint('create farm button clicked2');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FarmPage(farms: farm),
      ),
    );
  } catch (e) {
    // Handle exceptions
    debugPrint('Error: $e');
  }
},
              child: const Text('Create Farm', style: TextStyle(color: Colors.white),),
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




class SoilPropertyContainer extends StatelessWidget {
  final Question question;
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;

  SoilPropertyContainer({
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding:const EdgeInsets.all(16),
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
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF7988A4)),
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
                      groupValue: selectedOption,
                      onChanged: (value) => onOptionSelected(value as String?),
                      activeColor:const Color(0xFF026742),

                    ),
                    Text(
                      option,
                      style:const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF026742)),
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

  Question({required this.question, required this.options}) : id = question.replaceAll(' ', '_').toLowerCase();
}
