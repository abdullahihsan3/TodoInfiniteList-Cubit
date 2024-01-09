import 'package:json_annotation/json_annotation.dart';

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

List<TodosModel> todosModelFromJson(String str) =>
    List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todosModelToJson(List<TodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
@immutable
class TodosModel extends Equatable {
  final int userId;
  final int id;
  final String todo;
  final bool completed;

  const TodosModel(
      {required this.userId,
      required this.id,
      required this.todo,
      required this.completed});

   factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
         userId: json["userId"],
         id: json["id"],
         todo: json["title"],
         completed: json["completed"],
       );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "todo": todo,
        "completed": completed,
      };
  @override
  List<Object?> get props => [userId, id, todo, completed];

  @override
  String toString() {
    return 'TodosModel{userId=$userId, id=$id, todo=$todo, completed=$completed}';
  }

}
