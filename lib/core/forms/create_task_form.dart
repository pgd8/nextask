import 'package:flutter/material.dart';
import 'package:nextask/core/data/models/task_model.dart';
import 'package:nextask/core/shared/widgets/custom_main_button.dart';
import 'package:nextask/core/shared/widgets/date_time_selector.dart';
import 'package:nextask/core/utils/firebase/fire_store_services.dart';
import 'package:nextask/features/home/tabs/home_tab/widgets/piriority_category_selector.dart';
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: .start,
        spacing: Units.getVerticalPadding(verticalPadding: 4, context: context),
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
          CustomMainButton(
            btnTitle: 'Create Task',
            onTap: () {
              fireStoreServices.createTask(
                task: TaskModel(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dateTime: DateTime.now().toString(),
                  category: 'Home',
                  piriority: 1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
