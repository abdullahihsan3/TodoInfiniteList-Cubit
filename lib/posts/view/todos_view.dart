import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_cubit/posts/bloc/todos_cubit.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TodosCubit, TodosState>(
        listener: (context, state) {
          if (state.status == TodosStatus.loading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Loading...'),
              ),
            );
          }
          if(state.status == TodosStatus.failure){
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error Fetching Todos...'),
              ),
            );
          }
        },
        buildWhen: (previous, current) {
          return previous.hasReachedMax != current.hasReachedMax ||
          previous.status!= current.status ||
          previous.todos!= current.todos;
        },
        builder: (context, state) {
          if (state.status == TodosStatus.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          }
          if (state.status == TodosStatus.success) {
            return ListView.builder(
              itemCount: state.todos?.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
              
                  child: ListTile(
                    title: Text(state.todos?[index].todo ?? 'No Todo'),
                    subtitle: Text(
                      state.todos?[index].userId.toString() ?? 'No UserId',
                    ),
                  ),
                );
              }),
            );
          }
          return Container();
        },
      ),
    );
  }



}
