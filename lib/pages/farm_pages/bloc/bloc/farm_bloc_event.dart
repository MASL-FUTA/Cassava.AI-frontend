part of 'farm_bloc_bloc.dart';

@immutable
sealed class FarmBlocEvent {}

// Events


class LoadFarmListEvent extends FarmListEvent {}

abstract class FarmListEvent extends Equatable {
  const FarmListEvent();

  @override
  List<Object> get props => [];
}

class FetchFarms extends FarmListEvent {}