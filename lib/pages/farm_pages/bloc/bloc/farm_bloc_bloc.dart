import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'farm_bloc_event.dart';
part 'farm_bloc_state.dart';

// Bloc
class FarmListBloc extends Bloc<FarmListEvent, FarmListState> {
  FarmListBloc() : super(EmptyFarmListState()) {
    on<FetchFarms>(_mapFetchFarmsToState);
  }

  @override
  Stream<FarmListState> mapEventToState(FarmListEvent event) async* {
    // if (event is FetchFarms) {
    //   yield* _mapFetchFarmsToState();
    // }
  }

  Stream<FarmListState> _mapFetchFarmsToState(
      FetchFarms event, Emitter<FarmListState> emit) async* {
    try {
      // Use shared preferences to fetch farm details
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? farmName = prefs.getString('farmName');
      final String? farmLocation = prefs.getString('farmLocation');
      final String? farmSize = prefs.getString('farmSize');
      final String? unit = prefs.getString('unit');
      final String? stage = prefs.getString('stage');
      final String? soilPH = prefs.getString('soilPH');
      final String? soilType = prefs.getString('soilType');

      if (farmName == null ||
          farmLocation == null ||
          farmSize == null ||
          unit == null ||
          stage == null ||
          soilPH == null ||
          soilType == null) {
        // If any of the required fields is null, consider it as empty
        emit(EmptyFarmListState());
      } else {
        // Create FarmDetails object using the fetched data
        final FarmDetails farmDetails = FarmDetails(
          farmName: farmName,
          farmLocation: farmLocation,
          farmSize: farmSize,
          unit: unit,
          stage: stage,
          soilPH: soilPH,
          soilType: soilType,
        );

        // List<FarmDetails> farms = await fetchFarms();
        emit(NonEmptyFarmListState(farms: [farmDetails]));
      }
    } catch (e) {
      // Handle error
      debugPrint('Error fetching farms: $e');
      emit(
          EmptyFarmListState()); // You can customize error handling based on your needs
    }
  }
}

class FarmDetailsBloc extends Cubit<FarmDetails> {
  FarmDetailsBloc() : super(FarmDetails());

  void updateFarmDetails({
    required String farmName,
    required String farmLocation,
    required String farmSize,
    required String unit,
    required String stage,
    required String soilPH,
    required String soilType,
  }) {
    emit(state.copyWith(
      farmName: farmName,
      farmLocation: farmLocation,
      farmSize: farmSize,
      unit: unit,
      stage: stage,
      soilPH: soilPH,
      soilType: soilType,
    ));
  }

  void updateSoilPropertyDetails({
    required String soilTexture,
    required String? soilMoisture,
    required String? drainage,
    required String? organicMatter,
    required String? salinity,
    required String? erosionStatus,
  }) {
    // Extract the existing SoilPropertyDetails from the state
    final SoilPropertyDetails existingSoilPropertyDetails =
        state.soilPropertyDetails!;

    // Update the SoilPropertyDetails
    final updatedSoilPropertyDetails = SoilPropertyDetails(
      soilTexture: soilTexture,
      soilMoisture: soilMoisture,
      drainage: drainage,
      organicMatter: organicMatter,
      salinity: salinity,
      erosionStatus: erosionStatus,
    );

    // Copy the existing state and update the SoilPropertyDetails
    emit(state.copyWith(soilPropertyDetails: updatedSoilPropertyDetails));
  }
}

class FarmDetails {
  String farmName = '';
  String farmLocation = '';
  String farmSize = '';
  String unit = 'Plots';
  String stage = 'Planting Stage';
  String soilPH = '';
  String soilType = 'Loamy soil';
  SoilPropertyDetails? soilPropertyDetails; // Make it nullable

  FarmDetails({
    this.farmName = '',
    this.farmLocation = '',
    this.farmSize = '',
    this.unit = 'Plots',
    this.stage = 'Planting Stage',
    this.soilPH = '',
    this.soilType = 'Loamy soil',
    this.soilPropertyDetails,
  });

  FarmDetails copyWith({
    String? farmName,
    String? farmLocation,
    String? farmSize,
    String? unit,
    String? stage,
    String? soilPH,
    String? soilType,
    SoilPropertyDetails? soilPropertyDetails,
  }) {
    return FarmDetails(
      farmName: farmName ?? this.farmName,
      farmLocation: farmLocation ?? this.farmLocation,
      farmSize: farmSize ?? this.farmSize,
      unit: unit ?? this.unit,
      stage: stage ?? this.stage,
      soilPH: soilPH ?? this.soilPH,
      soilType: soilType ?? this.soilType,
      soilPropertyDetails: soilPropertyDetails ?? this.soilPropertyDetails,
    );
  }

  FarmDetails.getData(Map<String, dynamic> map) {
    farmName = map["farmName"];
    farmLocation = map["farmLocation"];
    farmSize = map["farmSize"];
    unit = map["unit"];
    stage = map["stage"];
    soilPH = map["soilPH"];
    soilType = map["soilType"];
    soilPropertyDetails = map["soilPropertyDetails"];
  }

  Map<String, dynamic> getMap() {
    return {
      'farmName':farmName,
      'farmLocation':farmLocation,
      'farmSize':farmSize,
      'unit':unit,
      'stage':stage,
      'soilPH':soilPH,
      'soilType':soilType,
      'soilPropertyDetails':soilPropertyDetails,
    };
  }

  Map<String, String?> selectedOptions = {
    'soilTexture': null,
    'soilMoisture': null,
    'drainage': null,
    'organicMatter': null,
    'salinity': null,
    'erosionStatus': null,
  };
}

class SoilPropertyDetails {
  final String? soilTexture;
  final String? soilMoisture;
  final String? drainage;
  final String? organicMatter;
  final String? salinity;
  final String? erosionStatus;

  SoilPropertyDetails({
    required this.soilTexture,
    required this.soilMoisture,
    required this.drainage,
    required this.organicMatter,
    required this.salinity,
    required this.erosionStatus,
  });
}
