
part of 'todos_cubit.dart';

enum TodosStatus { initial, success, failure ,loading}

final class TodosState extends Equatable {
    const TodosState({
     this.status,
     this.todos,
     this.hasReachedMax
  });


  final TodosStatus? status;
  final List<TodosModel>? todos;
  final bool? hasReachedMax;

  TodosState copyWith({
    TodosStatus? status,
    List<TodosModel>? todos,
    bool? hasReachedMax,
  }) {
    return TodosState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'TodosState{status=$status, todos=$todos, hasReachedMax=$hasReachedMax}';
  }


  @override
  List<Object?> get props => [status, todos, hasReachedMax];

}
