part of 'farm_bloc_bloc.dart';

@immutable
sealed class FarmBlocState {}

final class FarmBlocInitial extends FarmBlocState {}



// States
abstract class FarmListState extends Equatable {
  const FarmListState();

  @override
  List<Object> get props => [];
}

class EmptyFarmListState extends FarmListState {}

class NonEmptyFarmListState extends FarmListState {
  final List<Farm> farms;

  const NonEmptyFarmListState({required this.farms});

  @override
  List<Object> get props => [farms];
}

class LoadingFarmListState extends FarmListState {}