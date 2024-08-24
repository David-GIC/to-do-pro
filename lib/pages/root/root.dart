import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:check_list_app/pages/dashboard/dasboard.dart';
import 'package:check_list_app/providers/root.dart';
import 'package:check_list_app/utils/app_colors.dart';
import 'package:check_list_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../to_do/to_do_list.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RootProvider>(context);
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: const [DashboardPage(), ToDoListPage()][provider.index],
        bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 20, right: 16, left: 16),
            //disable splash background
            color: AppColor.whiteColor,
            child: BottomBarFloating(
              pad: 3,
              iconSize: 25,
              curve: Curves.fastOutSlowIn,
              boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 1, color: AppColor.primaryColor.withOpacity(0.1), offset: const Offset(1, 0))],
              borderRadius: BorderRadius.circular(30),
              titleStyle: AppTextStyle.normalStyle.copyWith(fontSize: 13),
              items: provider.items,
              backgroundColor: AppColor.whiteColor,
              color: Colors.black,
              colorSelected: AppColor.primaryColor,
              indexSelected: provider.index,
              paddingVertical: 24,
              onTap: (int val) => provider.onChangeIndex(val),
            )));
  }
}
