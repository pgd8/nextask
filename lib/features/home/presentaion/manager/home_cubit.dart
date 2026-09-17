import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextask/core/data/models/task_model.dart';
import 'package:nextask/core/utils/firebase/fire_store_services.dart';
import 'package:nextask/features/home/presentaion/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());
  final FireStoreServices _fireStoreServices = FireStoreServices();

  void createTask({required TaskModel task}) {
    emit(InitialAddTaskState());
    try {
      emit(LoadingAddTaskState());
      _fireStoreServices.createTask(task: task);
      emit(SuccessAddTaskState());
    } catch (e) {
      emit(FailedAddTaskState(errorMessage: e.toString()));
    }
  }

  void readTasks() {
    emit(InitialGetTasksState());
    try {
      emit(LoadingGetTasksState());
      _fireStoreServices.readTasks();
      emit(SuccessGetTasksState());
    } catch (e) {
      emit(FailureGetTasksState(errorMessage: e.toString()));
    }
  }
}
