import 'package:bloc/bloc.dart';
import 'package:tasks/app/modules/home/domain/usecases/get_tasks_usecase.dart';
import 'package:tasks/app/modules/home/presenter/blocs/get_tasks_cubit/get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  final GetTasksUsecase usecase;
  GetTasksCubit(this.usecase) : super(InitialGetTasksState());

  Future getTasks() async {
    emit(LoadingGetTasksState());
    final result = await usecase.getTasks();
    result.fold((l) {
      emit(ErrorGetTasksState(error: l.toString()));
    }, (r) {
      emit(SuccessGetTasksState(tasks: r));
    });
  }
}
