// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart' as dz;

import 'package:tasks/app/modules/home/domain/entity/task.dart';
import 'package:tasks/app/modules/home/infra/repositories/get_tasks_repository.dart';

abstract class IGetTasksUsecase {
  Future<dz.Either<Exception, List<Task>>> getTasks();
}

class GetTasksUsecase implements IGetTasksUsecase {
  final GetTasksRepository repository;
  GetTasksUsecase({
    required this.repository,
  });
  @override
  Future<dz.Either<Exception, List<Task>>> getTasks() async {
    return await repository.getTasks();
  }
}
