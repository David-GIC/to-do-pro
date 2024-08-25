import 'package:check_list_app/models/to_do.dart';
import 'package:check_list_app/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/to_do.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/common_utils.dart';
import '../create_or_edit_to_do.dart';

class ToDoCardWidget extends StatelessWidget {
  final ToDo item;
  final int index;
  const ToDoCardWidget({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: ListTile(
          title: Text(
            item.title,
            style: item.priority
                ? AppTextStyle.titleStyle.copyWith(color: Colors.red)
                : AppTextStyle.titleStyle,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.description,
                style: AppTextStyle.normalStyle,
              ),
              Text(
                "Date Time: ${CommonUtils.formatDateTime(item.createdDate)}",
                style: AppTextStyle.normalGrayStyle,
              ),
            ],
          ),
          trailing: Checkbox(
            value: item.isCompleted,
            onChanged: (value) {
              toDoProvider.toggleCompletion(index);
              if (value == true) {
                toastMessageSuccess("Mark as completed", context);
              } else {
                toastMessageSuccess("Mark as incomplete", context);
              }
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateOrEditToDoPage(
                  index: index,
                  toDoItem: item,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
