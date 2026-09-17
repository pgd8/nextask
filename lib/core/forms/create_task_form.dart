import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextask/core/data/models/task_model.dart';
import 'package:nextask/core/shared/widgets/custom_main_button.dart';
import 'package:nextask/core/shared/widgets/date_time_selector.dart';
import 'package:nextask/core/utils/firebase/fire_store_services.dart';
import 'package:nextask/features/home/presentaion/manager/home_cubit.dart';
import 'package:nextask/features/home/presentaion/manager/home_state.dart';
import 'package:nextask/features/home/presentaion/view/tabs/home_tab/widgets/piriority_category_selector.dart';
import 'package:nextask/core/shared/widgets/text_input_field.dart';
import 'package:nextask/core/utils/units.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({super.key});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();
  FireStoreServices fireStoreServices = FireStoreServices();

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is SuccessAddTaskState){
          context.pop();
        }
        if(state is FailedAddTaskState){

        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .start,
          spacing: Units.getVerticalPadding(
              verticalPadding: 4, context: context),
          children: [
            Text('Title'),
            TextInputField(
              controller: _titleController,
              hintText: 'Ex: meeting with CEO',
            ),
            Text('Description'),
            TextInputField(
              controller: _descriptionController,
              hintText: 'Ex: present the new project',
            ),
            SizedBox(
              height: Units.getVerticalPadding(
                verticalPadding: 5,
                context: context,
              ),
            ),
            const Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                DateTimeSelector(isDateSelector: true),
                DateTimeSelector(isDateSelector: false),
              ],
            ),
            SizedBox(
              height: Units.getVerticalPadding(
                verticalPadding: 5,
                context: context,
              ),
            ),
            const Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                PiriorityCategorySelector(isCategorySelector: true),
                PiriorityCategorySelector(isCategorySelector: false),
              ],
            ),
            SizedBox(
              height: Units.getVerticalPadding(
                verticalPadding: 4,
                context: context,
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadingAddTaskState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                return CustomMainButton(
                  btnTitle: 'Create Task',
                  onTap: () {
                    context.read<HomeCubit>().createTask(
                      task: TaskModel(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        dateTime: DateTime.now().toString(),
                        category: 'Home',
                        piriority: 1,
                      ),
                    );
                  },
                );;
              },
            ),
          ],
        ),
      ),
    );
  }
}
