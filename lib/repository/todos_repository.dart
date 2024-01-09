import 'dart:convert';

import 'package:infinite_list_cubit/posts/model/todos_model.dart';
import 'package:http/http.dart' as http;

class TodosRepository {
  Future<List<TodosModel>> fetchTodos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));
    final decoded = json.decode(response.body);
    final List<TodosModel> todosList = [];
   for (Map<String, dynamic> json in decoded) {
    TodosModel model = TodosModel.fromJson(json);
    todosList.add(model);
  }
    return todosList;
  }
}
