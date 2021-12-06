import 'dart:collection';

import 'package:firestore_bloc_todos/models/todo.dart';
import 'package:firestore_bloc_todos/repository/todos_repository.dart';

class TodosRepositoryImpl extends TodosRepository {
  final TodosRepository localRepository;
  final TodosRepository remoteRepository;
  final Map<String, Todo> inMemoryCache;

  TodosRepositoryImpl(
      {required this.localRepository, required this.remoteRepository})
      : inMemoryCache = HashMap();

  @override
  Future<List<Todo>> loadTodos() async {
    try {
      if (inMemoryCache.isNotEmpty) {
        return await loadTodosFromMemoryCache();
      }
      return await localRepository.loadTodos();
    } catch (e) {
      final todos = await remoteRepository.loadTodos();
      await localRepository.saveTodos(todos);
      return todos;
    }
  }

  @override
  Future saveTodos(List<Todo> todos) {
    return Future.wait<dynamic>([
      localRepository.saveTodos(todos),
      remoteRepository.saveTodos(todos),
      saveTodosInMemoryCache(todos)
    ]);
  }

  Future saveTodosInMemoryCache(List<Todo> todos) async {
    for (var element in todos) {
      inMemoryCache.putIfAbsent(element.id, () => element);
    }
  }

  Future<List<Todo>> loadTodosFromMemoryCache() async {
    return inMemoryCache.values.toList();
  }
}
