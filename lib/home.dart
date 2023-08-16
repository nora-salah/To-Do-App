
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/reusable/custom_elevated_btn.dart';
import 'package:todo_app/reusable/navigation.dart';
import 'package:todo_app/templets/app_asset.dart';
import 'package:todo_app/templets/colors.dart';
import 'package:todo_app/templets/strings.dart';
import 'package:flutter/material.dart';

import 'add_task/add_task.dart';
import 'add_task/task_model.dart';
import 'cubit/task_cubit.dart';
import 'cubit/task_state.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // intl flutter pakadge
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                //  Text(DateFormat.ymmmd().format(DateTime.now())),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppString.today,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppString.today,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                //date paker time line  flutter  packadge
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.Primary,
                  selectedTextColor: AppColors.white,
                  dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                  dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                  monthTextStyle: Theme.of(context).textTheme.displayMedium!,
                  onDateChange: (date) {
                    // New date selected
                    /*setState(() {
                  _selectedValue = date;
                });*/
                  },
                ),
                //
                const SizedBox(
                  height: 50,
                ),
                BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                    ? noTaskWidget(context)
                    : Expanded(
                  child: ListView.builder(
                      itemCount: BlocProvider.of<TaskCubit>(context).taskList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 240,
                                    color: AppColors.deepgrey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 48,
                                            width: double.infinity,
                                            child: CustomElevatedBtn(
                                              text: AppString.addTask,
                                              onPRessed: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          SizedBox(
                                            height: 48,
                                            width: double.infinity,
                                            child: CustomElevatedBtn(
                                              text: AppString.deleteTask,
                                              color: AppColors.lRed,
                                              onPRessed: () {},
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          SizedBox(
                                            height: 48,
                                            width: double.infinity,
                                            child: CustomElevatedBtn(
                                              text: AppString.cancel,
                                              onPRessed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: TaskComponent(
                            taskModel: BlocProvider.of<TaskCubit>(context).taskList[index],
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.Primary,
        onPressed: () {
          navigate(context: context, screen: AddTaskScreen());
        },
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }

  Column noTaskWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.noTasks),
        Text(
          AppString.noTaskTile,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: 24,
          ),
        ),
        Text(AppString.noTaskSubTile,
            style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: getColor(taskModel.color),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${taskModel.startTime}_ ${taskModel.endTime}",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    taskModel.note,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 75,
            width: 1,
            color: Colors.white,
            margin: const EdgeInsets.only(right: 10),
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted ? AppString.completed : AppString.toDo,
                style: Theme.of(context).textTheme.displayMedium,
              )),
        ],
      ),
    );
  }
}
