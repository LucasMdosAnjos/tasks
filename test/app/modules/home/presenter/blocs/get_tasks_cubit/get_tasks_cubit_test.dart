import 'package:dartz/dartz.dart' as dz;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks/app/modules/home/domain/entity/task.dart';
import 'package:tasks/app/modules/home/domain/usecases/get_tasks_usecase.dart';
import 'package:tasks/app/modules/home/infra/repositories/get_tasks_repository.dart';
import 'package:tasks/app/modules/home/presenter/blocs/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasks/app/modules/home/presenter/blocs/get_tasks_cubit/get_tasks_state.dart';

class GetTasksRepositoryMock extends Mock implements GetTasksRepository {}

void main() {

  late GetTasksRepositoryMock repository;
  late GetTasksUsecase usecase;
  late GetTasksCubit cubit;

  setUpAll(() {
    repository = GetTasksRepositoryMock();
    usecase = GetTasksUsecase(repository: repository);
    cubit = GetTasksCubit(usecase);
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

      expect(
          cubit.stream,
          emitsInOrder(
              [isA<LoadingGetTasksState>(), isA<SuccessGetTasksState>()]));

      await cubit.getTasks();
    });

    test('get all tasks with error', () async {
      when(() => repository.getTasks())
          .thenAnswer((invocation) async => dz.Left(Exception('Error')));

      expect(
          cubit.stream,
          emitsInOrder(
              [isA<LoadingGetTasksState>(), isA<ErrorGetTasksState>()]));

      await cubit.getTasks();
    });
  });
}
