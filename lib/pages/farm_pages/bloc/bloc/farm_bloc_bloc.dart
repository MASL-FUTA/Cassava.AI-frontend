import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:meta/meta.dart';

part 'farm_bloc_event.dart';
part 'farm_bloc_state.dart';





// Bloc
class FarmListBloc extends Bloc<FarmListEvent, FarmListState> {
  FarmListBloc() : super(EmptyFarmListState()) {
    on<FetchFarms>((event, emit) {
      add(FetchFarms());
    });
    }
   
  
  @override
  Stream<FarmListState> mapEventToState(FarmListEvent event) async* {
    if (event is FetchFarms) {
      yield* _mapFetchFarmsToState();
    }
  }

  
  Stream<FarmListState> _mapFetchFarmsToState() async* {
    try {
      final Box<FarmDetails> farmBox = Hive.box<FarmDetails>('farmBox');
      final List<FarmDetails> farms = farmBox.values.toList();

      if (farms.isEmpty) {
        yield EmptyFarmListState();
      } else {
        yield NonEmptyFarmListState(farms: farms);
      }
    } catch (e) {
      // Handle error
      print('Error fetching farms: $e');
      yield EmptyFarmListState(); // You can customize error handling based on your needs
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
    final SoilPropertyDetails existingSoilPropertyDetails = state.soilPropertyDetails!;

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


// enum SoilPropertyEvent { OptionSelected }

// class SoilPropertyBloc extends Bloc<SoilPropertyEvent, Map<String, String?>> {
//   SoilPropertyBloc() : super({});

//   @override
//   Stream<Map<String, String?>> mapEventToState(SoilPropertyEvent event) async* {
//     if (event == SoilPropertyEvent.OptionSelected) {
//       // Handle the option selected event and update the state accordingly
//       // You'll need to modify this logic based on your requirements
//       // For simplicity, you can update the state with the selected options
//       yield state;  // Replace with the logic to update the state based on the selected option
//     }
//   }
// }
