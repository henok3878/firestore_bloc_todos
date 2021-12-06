part of 'todos_bloc.dart';

@immutable
abstract class TodosState {}

class TodosLoadInProgress extends TodosState {}

class TodosLoadSuccess extends TodosState {
  final List<Todo> todos;

  TodosLoadSuccess(this.todos);
}

class TodoLoadFailure extends TodosState {}
