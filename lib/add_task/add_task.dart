import 'package:todo_app/add_task/task_model.dart';
import 'package:todo_app/cubit/task_cubit.dart';
import 'package:todo_app/reusable/custom_elevated_btn.dart';
import 'package:todo_app/reusable/navigation.dart';
import 'package:todo_app/templets/colors.dart';
import 'package:todo_app/templets/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../cubit/task_state.dart';
import '../reusable/add_task_component.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          AppString.addtask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            if( state is InsertTaskSuccessState){
              showToast(message: 'Added Successfully', state: ToastStates.success);
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<TaskCubit>(context).formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AddTaskComponent(
                      validator: (val){
                        if(val!.isEmpty){
                          return AppString.titleErrorMsg;
                        }
                         //return null;
                      },
                      controller:
                          BlocProvider.of<TaskCubit>(context).titleController,
                      hintText: AppString.titleHint,
                      title: AppString.title,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AddTaskComponent(
                      validator: (val) {
                        if(val!.isEmpty){
                          return AppString.noteErrorMsg;
                        }
                        //return null;
                      },
                      controller:
                          BlocProvider.of<TaskCubit>(context).noteController,
                      hintText: AppString.noteHint,
                      title: AppString.note,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AddTaskComponent(
                      hintText: DateFormat.yMd().format(
                          BlocProvider.of<TaskCubit>(context).currentDate),
                      title: AppString.date,
                      readOnly: true,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            BlocProvider.of<TaskCubit>(context)
                                .getDate(context);
                          },
                          icon: const Icon(Icons.calendar_month_rounded)),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AddTaskComponent(
                            title: AppString.startTime,
                            readOnly: true,
                            hintText:
                                BlocProvider.of<TaskCubit>(context).startTime,
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<TaskCubit>(context)
                                      .getStartTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: AddTaskComponent(
                            title: AppString.endTime,
                            readOnly: true,
                            hintText:
                                BlocProvider.of<TaskCubit>(context).endTime,
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  BlocProvider.of<TaskCubit>(context)
                                      .getEndTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppString.color,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<TaskCubit>(context)
                                  .checkChangeMarkIndex(index);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  BlocProvider.of<TaskCubit>(context)
                                      .getColor(index),
                              child: index ==
                                      BlocProvider.of<TaskCubit>(context)
                                          .currentIndex
                                  ? const Icon(Icons.check)
                                  : null,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8.w,
                        ),
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    //Spacer(),
                    SizedBox(
                      height: 90.h,
                    ),
                    state is InsertTaskLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.Primary))
                        : SizedBox(
                            height: 48.h,
                            width: double.infinity,
                            child: CustomElevatedBtn(
                                text: AppString.createTask,
                                onPRessed: () {
                                  if(BlocProvider.of<TaskCubit>(context).formKey.currentState!.validate()){
                                    BlocProvider.of<TaskCubit>(context)
                                        .insertTask();
                                  }

                                }),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
