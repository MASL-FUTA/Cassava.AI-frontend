import 'package:bloc/bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:meta/meta.dart';

part 'farm_bloc_event.dart';
part 'farm_bloc_state.dart';

class FarmBlocBloc extends Bloc<FarmBlocEvent, FarmBlocState> {
  FarmBlocBloc() : super(FarmBlocInitial()) {
    on<FarmBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

// BLoC
class FarmListBloc extends Bloc<FarmListEvent, FarmListState> {
  FarmListBloc() : super(EmptyFarmListState());

  @override
  Stream<FarmListState> mapEventToState(FarmListEvent event) async* {
    if (event is LoadFarmListEvent) {
      // Fetch farms from API or other data source
      List<Farm> farms = await fetchData(); // Replace with your data fetching logic

      if (farms.isEmpty) {
        yield EmptyFarmListState();
      } else {
        yield NonEmptyFarmListState(farms);
      }
    }
  }

  Future<List<Farm>> fetchData() async {
    // Simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return []; // Replace with your actual data fetching logic
  }
}
