import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:meta/meta.dart';

part 'farm_bloc_event.dart';
part 'farm_bloc_state.dart';

// class FarmBlocBloc extends Bloc<FarmBlocEvent, FarmBlocState> {
//   FarmBlocBloc() : super(FarmBlocInitial()) {
//     on<FarmBlocEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }



// Bloc
class FarmListBloc extends Bloc<FarmListEvent, FarmListState> {
  FarmListBloc() : super(EmptyFarmListState()) {
   // add(FetchFarms()); // Add this line to trigger the initial fetch farms logic
  }

  @override
  Stream<FarmListState> mapEventToState(FarmListEvent event) async* {
    if (event is FetchFarms) {
      yield* _mapFetchFarmsToState();
    }
  }

  Stream<FarmListState> _mapFetchFarmsToState() async* {
    try {
      final Box<Farm> farmBox = Hive.box<Farm>('farmBox');
      final List<Farm> farms = farmBox.values.toList();

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


