import 'package:dartz/dartz.dart' as dz;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks/app/modules/home/domain/entity/task.dart';
import 'package:tasks/app/modules/home/domain/usecases/get_tasks_usecase.dart';
import 'package:tasks/app/modules/home/infra/repositories/get_tasks_repository.dart';

class GetTasksRepositoryMock extends Mock implements GetTasksRepository {}

void main() {
  late GetTasksRepositoryMock repository;
  late GetTasksUsecase usecase;

  setUpAll(() {
    repository = GetTasksRepositoryMock();
    usecase = GetTasksUsecase(repository: repository);
  });

  group('get tasks | ', () {
    test('get all tasks with success', () async {
      when(() => repository.getTasks())
          .thenAnswer((invocation) async => const dz.Right([
                Task(
                    id: 1,
                    description: 'description',
                    category: CategoryTask.personal,
                    check: false)
              ]));

      final result = await usecase.getTasks();

      expect(result.isRight(), true);

      final tasks = result.fold(dz.id, dz.id);

      expect((tasks as List<Task>).length, 1);
    });

    test('get all tasks with error', () async {
      when(() => repository.getTasks())
          .thenAnswer((invocation) async => dz.Left(Exception('Error')));

      final result = await usecase.getTasks();

      expect(result.isLeft(), true);

      final error = result.fold(dz.id, dz.id);

      expect(error, isA<Exception>());
    });
  });
}
