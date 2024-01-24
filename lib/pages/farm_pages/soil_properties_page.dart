import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';

class SoilPropertyPage extends StatefulWidget {
  @override
  _SoilPropertyPageState createState() => _SoilPropertyPageState();
}

Future<void> openFarmBox() async {
  if (!Hive.isBoxOpen('farmBox')) {
    await Hive.openBox<Farm>('farmBox');
  }
}
 
final Box<Farm> farmBox = Hive.box<Farm>('farmBox');

//  Future<void> saveFarm() async {
//     Farm farm = Farm(
//       name: 'Farm Name', temperature: 25, weatherCondition: WeatherCondition.sunny,
//     );

//     farmBox.add(farm);
//     print('Farm saved locally.');
//     // Send data to backend
//     try {
//       final response = await http.post(
//         //to change to the backend api url
//         'your_backend_api_url' as Uri,
//         body: jsonEncode({
//           'name': farm.name,
//           'temperature': farm.temperature,
//           'weatherCondition': farm.weatherCondition,
//           // Add other fields as needed
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         print('Farm saved on the backend.');
//       } else {
//         print('Failed to save farm on the backend.');
//       }
//     } catch (e) {
//       print('Error sending data to backend: $e');
//     }
//   }


Future<bool> saveFarmLocally() async {
  try {
    Farm farm = Farm(
      name: 'Farm Name', temperature: 25, weatherCondition: WeatherCondition.sunny,
    );

    farmBox.add(farm);
    print('Farm saved locally.');
    return true; // Indicates successful local save
  } catch (e) {
    print('Error saving farm locally: $e');
    return false; // Indicates local save failure
  }
}

Future<bool> saveFarmToBackend() async {
  try {
    Farm farm = Farm(
      name: 'Farm Name', temperature: 25, weatherCondition: WeatherCondition.sunny,
    );

    final response = await http.post(
      'your_backend_api_url' as Uri,
      body: jsonEncode({
        'name': farm.name,
        'temperature': farm.temperature,
        'weatherCondition': farm.weatherCondition,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Farm saved on the backend.');
      return true; // Indicates successful backend save
    } else {
      print('Failed to save farm on the backend.');
      return false; // Indicates backend save failure
    }
  } catch (e) {
    print('Error sending data to backend: $e');
    return false; // Indicates backend save failure due to error
  }
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
//             onPressed: () async {
//   await openFarmBox();
//   print('create farm button clicked');
  
//   // Save the farm locally and check if it was successful
//   bool localSaveSuccess = await saveFarmLocally();
  
//   if (localSaveSuccess) {
//     // Save the farm to the backend and check if it was successful
//     bool backendSaveSuccess = await saveFarmToBackend();
//      Navigator.push(context, MaterialPageRoute(builder: (context) => FarmPage()));
    
//     if (backendSaveSuccess) {
//       // Navigate to FarmPage only if both local and backend saves were successful
//       Navigator.push(context, MaterialPageRoute(builder: (context) => FarmPage()));
//     } else {
//       print('Failed to save farm on the backend.');
//       // Handle backend save failure if needed
//     }
//   } else {
//     print('Failed to save farm locally.');
//     // Handle local save failure if needed
//   }
// },

onPressed: () async {
                    print('create farm button clicked');

                    // Create the farm object with the selected options
                    Farm farm = Farm(
                      // Populate with the selected options or any other data you need
                      name: 'Farm Name',
                      temperature: 25,
                      weatherCondition: WeatherCondition.sunny,
                    );

                    // Navigate to the Farms Page and pass the farm details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FarmPage(farm: farm),
                      ),
                    );
                  },
                
            child: const Text('Create Farm', style: TextStyle(color: Colors.white),),
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
