import 'package:tasks/app/modules/home/domain/entity/task.dart';

abstract class GetTasksDatasource {
  Future<List<Task>> getTasks();
}
