// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasks/app/modules/home/domain/entity/task.dart';

abstract class GetTasksState {}

class InitialGetTasksState implements GetTasksState {}

class LoadingGetTasksState implements GetTasksState {}

class SuccessGetTasksState implements GetTasksState {
  final List<Task> tasks;

  SuccessGetTasksState({required this.tasks});
}

class ErrorGetTasksState implements GetTasksState {
  String error;
  ErrorGetTasksState({
    required this.error,
  });
}
