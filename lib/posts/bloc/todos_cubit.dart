import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_cubit/posts/model/todos_model.dart';
import 'package:infinite_list_cubit/repository/todos_repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodosRepository todosRepository;
  TodosCubit({required this.todosRepository}) : super(const TodosState(status: TodosStatus.initial,todos: [],hasReachedMax: false));

  Future<void> fetchTodos() async {
    try {
      emit(state.copyWith(
        status: TodosStatus.loading,
      ));

      final todos = await todosRepository.fetchTodos();
      emit(state.copyWith(
        status: TodosStatus.success,
        todos: todos,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TodosStatus.failure,
      ));
    }
  }
}
