import 'package:check_list_app/pages/root/root.dart';
import 'package:check_list_app/providers/root.dart';
import 'package:check_list_app/providers/to_do.dart';
import 'package:check_list_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RootProvider()),
        ChangeNotifierProvider(create: (_) => ToDoProvider()),
      ],
      child: const CheckListApp(),
    ),
  );
}

class CheckListApp extends StatelessWidget {
  const CheckListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check list app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}
