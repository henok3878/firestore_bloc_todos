import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firestore_bloc_todos/models/models.dart';
import 'package:firestore_bloc_todos/repository/todos_repository.dart';
import 'package:meta/meta.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository todosRepository;

  TodosBloc({required this.todosRepository}) : super(TodosLoadInProgress()) {
    on<TodosLoaded>(_onTodosLoaded);
    on<TodoUpdated>(_onTodoUpdated);
    on<TodoDeleted>(_onTodoDeleted);
    on<ClearCompleted>(_onClearCompleted);
    on<TodoAdded>(_onTodoAdded);
  }

  void _onTodosLoaded(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      final todos = await todosRepository.loadTodos();
      emit(TodosLoadSuccess(todos));
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }

  void _onTodoUpdated(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      final todos = await todosRepository.loadTodos();
      emit(TodosLoadSuccess(todos));
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }

  void _onTodoAdded(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      final todos = await todosRepository.loadTodos();
      emit(TodosLoadSuccess(todos));
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }

  void _onClearCompleted(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      final todos = await todosRepository.loadTodos();
      emit(TodosLoadSuccess(todos));
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }

  void _onTodoDeleted(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      final todos = await todosRepository.loadTodos();
      emit(TodosLoadSuccess(todos));
    } catch (e) {
      emit(TodoLoadFailure());
    }
  }
}
