import 'package:flutter/cupertino.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';
import 'package:stacked/stacked.dart';

class FarmViewModel extends BaseViewModel{
  FarmDetails _farmDetails = FarmDetails();
  FarmDetails get farmDetails => _farmDetails;
  String _selectedUnit = 'Plots';
  String _selectedStage = 'Planting Stage';
  String _soilPH = '';
  String _soilType = 'Loamy soil';
  String _selectedSoil = 'Loamy soil';
  String _selectedSoilTexture = "";
  String _selectedSoilMoisture = "";
  String _selectedDrainage = "";
  String _selectedOrganicMatter = "";
  String _selectedSalinity = "";
  String _selectedErosionStatus = "";

  String get selectedSoilTexture=> _selectedSoilTexture;
  String get selectedSoilMoisture=> _selectedSoilMoisture;
  String get selectedDrainage=> _selectedDrainage;
  String get selectedOrganicMatter=> _selectedOrganicMatter;
  String get selectedSalinity=> _selectedSalinity;
  String get selectedErosionStatus=> _selectedErosionStatus;

  String get selectedUnit => _selectedUnit;
  String get selectedStage => _selectedStage;
  String get soilPH => _soilPH;
  String get soilType => _soilType;
  String get selectedSoil => _selectedSoil;

  TextEditingController _soilPHContoller = TextEditingController();
  TextEditingController _farmLocationController = TextEditingController();
  TextEditingController _farmSizeController = TextEditingController();
  TextEditingController _farmNameController = TextEditingController();

  TextEditingController get farmLocationController => _farmLocationController;
  TextEditingController get farmSizeController => _farmSizeController;
  TextEditingController get farmNameController => _farmNameController;
  TextEditingController get soilPHContoller => _soilPHContoller;

  final List<Question> questions = [
    Question(
      question: 'What is your soil texture?',
      options: ['Sandy', 'Clayey', 'Silt', 'Loamy'],
      id: "selectedSoilTexture",
    ),
    Question(
      question: 'What is the soil moisture level?',
      options: ['Dry', 'Moist', 'Wet'],
      id: "selectedSoilMoisture",
    ),
    Question(
      question: 'How drained is your soil?',
      options: ['Well Drained', 'Poor Drained'],
      id: "selectedDrainage",
    ),
    Question(
      question: 'What is the organic matter content of your soil?',
      id: "selectedOrganicMatter",
      options: ['Low', 'Medium', 'High'],
    ),
    Question(
      question: 'What is the salinity content of your soil?',
      options: ['Saline', 'Non-Saline'],
      id: "selectedSalinity",
    ),
    Question(
      question: 'What is the erosion status of your soil?',
      options: ['Eroded', 'Non-Eroded'],
      id: "selectedErosionStatus",
    ),
  ];

  Map<String, String> _farAnswers = {};

  Map<String, String> get farAnswers => _farAnswers;

  setFarmAnswers(Map<String, String> input){
    _farAnswers = input;
    notifyListeners();
  }

  setFarmDetails(FarmDetails input){
    _farmDetails = input;
    notifyListeners();
  }

  setSoilPHContoller(TextEditingController input){
    _soilPHContoller = input;
    notifyListeners();
  }

  setFarmLocationController(TextEditingController input){
    _farmLocationController = input;
    notifyListeners();
  }

  setFarmSizeController(TextEditingController input){
    _farmSizeController = input;
    notifyListeners();
  }

  setFarmNameController(TextEditingController input){
    _farmNameController = input;
    notifyListeners();
  }

  setSelectedUnit(String input){
    _selectedUnit = input;
    notifyListeners();
  }

  setSelectedStage(String input){
    _selectedStage = input;
    notifyListeners();
  }

  setSoilPH(String input){
    _soilPH = input;
    notifyListeners();
  }

  setSoilType(String input){
    _soilType = input;
    notifyListeners();
  }

  setSelectedSoil(String input){
    _selectedSoil = input;
    notifyListeners();
  }

  setSelectedSoilTexture(String input){
    _selectedSoilTexture = input;
    notifyListeners();
  }

  setSelectedSoilMoisture(String input){
    _selectedSoilMoisture = input;
    notifyListeners();
  }

  setSelectedDrainage(String input){
    _selectedDrainage = input;
    notifyListeners();
  }

  setSelectedOrganicMatter(String input){
    _selectedOrganicMatter = input;
    notifyListeners();
  }

  setSelectedSalinity(String input){
    _selectedSalinity = input;
    notifyListeners();
  }

  setSelectedErosionStatus(String input){
    _selectedErosionStatus = input;
    notifyListeners();
  }
}