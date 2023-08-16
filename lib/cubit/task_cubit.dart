import 'package:todo_app/cubit/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../add_task/task_model.dart';
import '../templets/colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now());

  String endTime = DateFormat("hh:mm a").format(DateTime.now());
  int currentIndex = 0;

  void getDate(context) async {
    emit(GetDateLoadingState());

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      // initialDatePickerMode: DatePickerMode.day,
      //  initialEntryMode: DatePickerEntryMode.input,
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSuccessState());
    } else {
      print('pickedDate== null');
      emit(GetDateErrorState());
    }
  }

  void getStartTime(context) async {
    emit(GetStartTimeLoadingState());
    TimeOfDay? pickedStartTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      emit(GetStartTimeSuccessState());
    } else {
      print('pickedstartTime ==null');
      emit(GetStartTimeErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeLoadingState());
    TimeOfDay? pickedEndTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      emit(GetEndTimeSuccessState());
    } else {
      print('pickedstartTime == null');
      emit(GetEndTimeErrorState());
    }
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.bluegrey;
      case 2:
        return AppColors.blue;
      case 3:
        return AppColors.bluegrey;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.purple;
      default:
        return AppColors.grey;
    }
  }

  void checkChangeMarkIndex(index) {
    currentIndex = index;
    emit(CheckChangeMarkIndex());
  }

  List<TaskModel> taskList = [];

  void insertTask() async {
    emit(InsertTaskLoadingState());
    try {
      await Future.delayed(Duration(seconds: 2));
      taskList.add(
        TaskModel(
          id: '1',
          title: titleController.text,
          date: DateFormat.yMd().format(currentDate),
          note: noteController.text,
          startTime: startTime,
          endTime: endTime,
          isCompleted: false,
          color: currentIndex,
        ),
      );
      titleController.clear();

      noteController.clear();
      emit(InsertTaskSuccessState());
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }
}

/*TaskModel( id:'1',
      title:'Learn Dart',
      note:'Flutter',
      startTime:'09:30 Am',
      endTime:'09:45 Am',

      date:'1/1/2023',
      isCompleted:false,
      color:1,),
    TaskModel( id:' Task2',
      title:'Learn json',
      note:'Java SQFlight',
      startTime:'07:30 Am',
      date:'1/10/2023',
      endTime:'07:45 Am',
      isCompleted:true,
      color:3,)*/
/*TimeOfDay? pickedEndTime =
                                      await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(
                                              DateTime.now()));
                                 /*setState(() {
                                    if (pickedEndTime != null) {
                                      endTime = pickedEndTime.format(context);
                                    } else {
                                      print('pickedEndTime ==null');
                                    }
                                  });*/*/
