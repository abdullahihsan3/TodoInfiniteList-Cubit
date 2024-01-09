import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_cubit/posts/bloc/todos_cubit.dart';
import 'package:infinite_list_cubit/posts/view/todos_view.dart';
import 'package:infinite_list_cubit/repository/todos_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => TodosCubit(todosRepository: TodosRepository())..fetchTodos(),
      child: const MaterialApp(
        home: TodosView(),
      ),
    );
  }
}
