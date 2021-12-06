import 'dart:async';

import 'package:firestore_bloc_todos/bloc/stats/stats.dart';
import 'package:firestore_bloc_todos/bloc/todos/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final TodosBloc todosBloc;
  late StreamSubscription todosSubscription;

  StatsBloc({required this.todosBloc}) : super(StatsLoadInProgress()) {
    _onTodosStateChanged(todosBloc.state);
    todosSubscription = todosBloc.stream.listen(_onTodosStateChanged);
    on<StatsUpdated>(_onStatsUpdated);
  }

  void _onStatsUpdated(StatsEvent event, Emitter<StatsState> emit) {
    final numActive = (event as StatsUpdated)
        .todos
        .where((element) => !element.isDone)
        .toList()
        .length;
    final numCompleted = (event as StatsUpdated)
        .todos
        .where((element) => element.isDone)
        .toList()
        .length;
    emit(StatsLoadSuccess(numActive: numActive, numCompleted: numCompleted));
  }

  void _onTodosStateChanged(state) {
    if (state is TodosLoadSuccess) {
      add(StatsUpdated(state.todos));
    }
  }

  @override
  Future<void> close() {
    todosSubscription.cancel();
    return super.close();
  }
}
