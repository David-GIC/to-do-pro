import 'package:check_list_app/pages/to_do/create_or_edit_to_do.dart';
import 'package:check_list_app/providers/to_do.dart';
import 'package:check_list_app/utils/app_text_style.dart';
import 'package:check_list_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          'To-Do List',
          style: AppTextStyle.titleStyle,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (item) {
              if (item == "1") {
                toDoProvider.sortByPriority();
              } else if (item == "2") {
                toDoProvider.sortToDoByCreatedDate();
              }
            },
            icon: const Icon(Icons.sort_rounded),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "1",
                child: Text('Sort by priority'),
              ),
              const PopupMenuItem(
                value: "2",
                child: Text('Sort by created date'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: toDoProvider.toDoList.length,
        itemBuilder: (context, index) {
          final item = toDoProvider.toDoList[index];
          return ListTile(
            title: Text(
              item.title,
              style: AppTextStyle.titleStyle,
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
              onChanged: (value) => toDoProvider.toggleCompletion(index),
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
            onLongPress: () => toDoProvider.deleteToDo(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateOrEditToDoPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
