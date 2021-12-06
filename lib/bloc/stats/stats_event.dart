import 'package:equatable/equatable.dart';
import 'package:firestore_bloc_todos/models/models.dart';

abstract class StatsEvent extends Equatable {
  const StatsEvent();
}

class StatsUpdated extends StatsEvent {
  final List<Todo> todos;

  const StatsUpdated(this.todos);

  @override
  String toString() {
    return "StatsUpdated {todos: $todos}";
  }

  @override
  List<Object> get props => [todos];
}
