

abstract class TaskState {}

class TaskInitial extends TaskState {}
class GetDateLoadingState extends TaskState {}
class GetDateSuccessState extends TaskState {}
class GetDateErrorState extends TaskState {}

class GetStartTimeLoadingState extends TaskState {}
class GetStartTimeSuccessState extends TaskState {}
class GetStartTimeErrorState extends TaskState {}

class GetEndTimeLoadingState extends TaskState {}
class GetEndTimeSuccessState extends TaskState {}
class GetEndTimeErrorState extends TaskState {}

class CheckChangeMarkIndex extends TaskState {}


class InsertTaskLoadingState extends TaskState {}
class InsertTaskSuccessState extends TaskState {}
class InsertTaskErrorState extends TaskState {}



