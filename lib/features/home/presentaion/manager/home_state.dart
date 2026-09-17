abstract class HomeState {}

//initial
class InitialHomeState extends HomeState {}

//get tasks state
class InitialGetTasksState extends HomeState {}

class LoadingGetTasksState extends HomeState {}

class SuccessGetTasksState extends HomeState {}

class FailureGetTasksState extends HomeState {
  final String errorMessage;

  FailureGetTasksState({required this.errorMessage});
}

// add tasks states
class InitialAddTaskState extends HomeState {}

class LoadingAddTaskState extends HomeState {}

class SuccessAddTaskState extends HomeState {}

class FailedAddTaskState extends HomeState {
  final String errorMessage;

  FailedAddTaskState({required this.errorMessage});
}
