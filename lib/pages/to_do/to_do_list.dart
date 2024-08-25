import 'package:check_list_app/pages/to_do/create_or_edit_to_do.dart';
import 'package:check_list_app/pages/to_do/widgets/to_to_card.dart';
import 'package:check_list_app/providers/to_do.dart';
import 'package:check_list_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
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
                toDoProvider.sortByPending();
              } else if (item == "3") {
                toDoProvider.sortByCompleted();
              } else if (item == "4") {
                toDoProvider.sortToDoByCreatedDate();
              }
            },
            icon: const Icon(Icons.sort_rounded),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: "1",
                child: Text('Sort by priority task'),
              ),
              const PopupMenuItem(
                value: "2",
                child: Text('Sort by pending task'),
              ),
              const PopupMenuItem(
                value: "3",
                child: Text('Sort by completed task'),
              ),
              const PopupMenuItem(
                value: "4",
                child: Text('Sort by created date'),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
        child: ListView.builder(
          itemCount: toDoProvider.toDoList.length,
          padding: const EdgeInsets.only(bottom: 70),
          itemBuilder: (context, index) {
            final item = toDoProvider.toDoList[index];
            return ToDoCardWidget(item: item, index: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CreateOrEditToDoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
