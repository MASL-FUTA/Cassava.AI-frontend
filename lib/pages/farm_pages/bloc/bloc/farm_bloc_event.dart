part of 'farm_bloc_bloc.dart';

@immutable
sealed class FarmBlocEvent {}

// Events
abstract class FarmListEvent {}

class LoadFarmListEvent extends FarmListEvent {}

