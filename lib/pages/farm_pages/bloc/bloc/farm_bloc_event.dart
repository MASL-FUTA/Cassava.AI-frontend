part of 'farm_bloc_bloc.dart';


abstract class FarmListEvent extends Equatable {
  const FarmListEvent();

  @override
  List<Object> get props => [];
}

class FetchFarms extends FarmListEvent {}

class FarmSelectedEvent extends FarmListEvent {
  final FarmDetails selectedFarm;

  FarmSelectedEvent(this.selectedFarm);
}