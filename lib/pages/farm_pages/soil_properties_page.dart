import 'package:flutter/material.dart';

class SoilPropertyPage extends StatefulWidget {
  @override
  _SoilPropertyPageState createState() => _SoilPropertyPageState();
}

class _SoilPropertyPageState extends State<SoilPropertyPage> {
  Map<String, String?> selectedOptions = {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Property'),
      ),
      body: Stack(
        children:[ SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
            onPressed: () {
              // Handle button press
            },
            child: Text('Create Farm', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    ),
            ],
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
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF7988A4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF7988A4)),
          ),
          SizedBox(height: 10),
          for (String option in question.options)
            InkWell(
              onTap: () => onOptionSelected(option),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Radio(
                      value: option,
                      groupValue: selectedOption,
                      onChanged: (value) => onOptionSelected(value as String?),
                      activeColor: Color(0xFF026742),

                    ),
                    Text(
                      option,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF026742)),
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
