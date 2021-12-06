import 'package:firestore_bloc_todos/models/todo.dart';

abstract class TodosRepository {
  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.
  Future<List<Todo>> loadTodos();

  // Persists todos to local disk and the web
  Future saveTodos(List<Todo> todos);
}
