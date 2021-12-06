import 'package:firestore_bloc_todos/bloc/tab/tab.dart';
import 'package:firestore_bloc_todos/models/app_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  TabBloc() : super(AppTab.todos) {
    on<TabUpdated>((event, emit) => emit(event.tab));
  }
}
