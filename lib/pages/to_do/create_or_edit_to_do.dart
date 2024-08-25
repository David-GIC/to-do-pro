import 'package:check_list_app/models/to_do.dart';
import 'package:check_list_app/utils/app_colors.dart';
import 'package:check_list_app/utils/app_text_style.dart';
import 'package:check_list_app/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/to_do.dart';

class CreateOrEditToDoPage extends StatefulWidget {
  final int? index;
  final ToDo? toDoItem;
  const CreateOrEditToDoPage({super.key, this.index, this.toDoItem});

  @override
  State<CreateOrEditToDoPage> createState() => _CreateOrEditToDoPageState();
}

class _CreateOrEditToDoPageState extends State<CreateOrEditToDoPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _priority = false;

  @override
  void initState() {
    if (widget.toDoItem != null) {
      _titleController.text = widget.toDoItem!.title;
      _descriptionController.text = widget.toDoItem!.description;
      _priority = widget.toDoItem!.priority;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ToDoProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          widget.index == null ? 'Add To-Do' : 'Edit To-Do',
          style: AppTextStyle.titleStyle,
        ),
        actions: [
          if (widget.index != null)
            IconButton(
                onPressed: () => DialogWidget.confirmDialog(
                      context: context,
                      title: "Are you sure to delete this item ?",
                      onApprove: () {
                        provider.deleteToDo(widget.index!);
                        Navigator.pop(context);
                      },
                    ),
                icon: const Icon(
                  Icons.delete,
                  color: AppColor.contentColorRed,
                ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    label: Text("Title", style: AppTextStyle.normalStyle)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                    label: Text("Description", style: AppTextStyle.normalStyle),
                    hintText: ""),
              ),
              CheckboxListTile(
                value: _priority,
                title: Text(
                  "Priority",
                  style: AppTextStyle.normalStyle,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.only(left: 0, right: 16),
                onChanged: (value) {
                  setState(() {
                    _priority = value ?? false;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newToDoItem = ToDo(
                        createdDate: widget.toDoItem != null
                            ? widget.toDoItem!.createdDate
                            : DateTime.now(),
                        title: _titleController.text,
                        description: _descriptionController.text,
                        priority: _priority,
                        isCompleted: widget.toDoItem != null
                            ? widget.toDoItem!.isCompleted
                            : false);
                    if (widget.index == null) {
                      provider.addToDo(newToDoItem);
                    } else {
                      provider.updateToDo(widget.index!, newToDoItem);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.index == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
