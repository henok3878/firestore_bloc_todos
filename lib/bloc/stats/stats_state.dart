import 'package:equatable/equatable.dart';

abstract class StatsState extends Equatable {
  const StatsState();

  @override
  List<Object> get props => [];
}

class StatsLoadInProgress extends StatsState {}

class StatsLoadSuccess extends StatsState {
  final int numActive;
  final int numCompleted;

  const StatsLoadSuccess({required this.numActive, required this.numCompleted});

  @override
  List<Object> get props => [numActive, numCompleted];

  @override
  String toString() {
    return "StatsLoadSucess {numActive: $numActive, numCompleted: $numCompleted";
  }
}
