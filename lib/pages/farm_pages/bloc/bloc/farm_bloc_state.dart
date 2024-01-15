part of 'farm_bloc_bloc.dart';

@immutable
sealed class FarmBlocState {}

final class FarmBlocInitial extends FarmBlocState {}

// States
abstract class FarmListState {}

class EmptyFarmListState extends FarmListState {}

class NonEmptyFarmListState extends FarmListState {
  final List<Farm> farms;

  NonEmptyFarmListState(this.farms);
}