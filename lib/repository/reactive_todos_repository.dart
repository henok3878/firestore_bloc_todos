import 'package:firestore_bloc_todos/models/todo.dart';

abstract class ReactiveTodosRepository {
  Future<void> addNewTodo(Todo todo);

  Future<void> deleteTodo(List<String> idList);

  Stream<List<Todo>> todos();

  Future<void> updateTodo(Todo todo);
}
