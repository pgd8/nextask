import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextask/core/data/models/task_model.dart';
import 'package:nextask/core/forms/create_task_form.dart';
import 'package:nextask/core/shared/widgets/custom_app_bar.dart';
import 'package:nextask/core/shared/widgets/task_item.dart';
import 'package:nextask/core/styles/assets_manager.dart';
import 'package:nextask/core/styles/colors_manager.dart';
import 'package:nextask/core/utils/constants.dart';
import 'package:nextask/core/utils/firebase/fire_store_services.dart';
import 'package:nextask/core/utils/units.dart';
import 'package:nextask/features/home/presentaion/manager/home_cubit.dart';
import 'package:nextask/features/home/presentaion/manager/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FireStoreServices fireStoreServices = FireStoreServices();

  @override
  void initState() {
    context.read<HomeCubit>().readTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: PreferredSize(
        preferredSize: Constants.getAppBarSize(context),
        child: CustomAppBar(isHome: true),
      ),
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: false,
            builder: (context) => Padding(
              padding: .symmetric(
                horizontal: Units.getHorizontalPadding(
                  horizontalPadding: 15,
                  context: context,
                ),
                vertical: Units.getVerticalPadding(
                  verticalPadding: 10,
                  context: context,
                ),
              ),
              child: Column(
                children: [
                  Container(alignment: .topEnd, child: CloseButton()),
                  CreateTaskForm(),
                ],
              ),
            ),
          );
        },
        backgroundColor: ColorsManager.warningDefaultColor,
        shape: CircleBorder(),
        isExtended: true,
        child: SvgPicture.asset(
          AssetsManager.addIcon,
          width: Units.getWidth(widgetWidth: 15, context: context),
        ),
      ),
      body: Padding(
        padding: .symmetric(
          vertical: Units.getVerticalPadding(
            verticalPadding: 10,
            context: context,
          ),
          horizontal: Units.getHorizontalPadding(
            horizontalPadding: 10,
            context: context,
          ),
        ),

        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) => (
          current is LoadingGetTasksState ||
              current is SuccessGetTasksState ||
              current is FailureGetTasksState
          ),

          builder: (context, state) {
            if(state is LoadingGetTasksState){
              return Center(child: CircularProgressIndicator(),);
            }

            if(state is FailureGetTasksState){
              return Center(child: Text(state.errorMessage),);
            }

            if(state is SuccessGetTasksState){
              return StreamBuilder<List<TaskModel>>(
                stream: fireStoreServices.readTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Center(child: Text('something went wrong'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Tasks yet'));
                  }

                  final tasks = snapshot.data ?? [];
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: Units.getHeight(widgetHeight: 10, context: context),
                    ),
                    itemBuilder: (context, index) => TaskItem(task: tasks[index]),
                    itemCount: tasks.length,
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
