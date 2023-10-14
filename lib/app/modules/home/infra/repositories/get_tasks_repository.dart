import 'package:dartz/dartz.dart' as dz;
import 'package:tasks/app/modules/home/domain/entity/task.dart';

abstract class GetTasksRepository {
  Future<dz.Either<Exception, List<Task>>> getTasks();
}
