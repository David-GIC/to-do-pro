import 'package:check_list_app/pages/dashboard/widgets/indicator.dart';
import 'package:check_list_app/utils/app_colors.dart';
import 'package:check_list_app/utils/app_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/to_do.dart';
import '../../utils/app_text_style.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int isTouched = 99;

  @override
  Widget build(BuildContext context) {
    final toDoProvider = Provider.of<ToDoProvider>(context);
    final priorityPendingCount = toDoProvider.toDoList
        .where((item) => item.priority && !item.isCompleted)
        .length;
    final priorityCompletedCount = toDoProvider.toDoList
        .where((item) => item.priority && item.isCompleted)
        .length;
    final completedCount =
        toDoProvider.toDoList.where((item) => item.isCompleted).length;
    final pendingCount = toDoProvider.toDoList.length - completedCount;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: AppTextStyle.titleStyle,
        ),
      ),
      body: SizedBox(
        height: AppSize.getDeviceHeight(context),
        width: AppSize.getDeviceWith(context),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 28,
              ),
              Indicator(
                color: AppColor.contentColorBlack,
                text: 'Total',
                isSquare: false,
                size: 14,
                textColor: isTouched == 1
                    ? AppColor.mainTextColor1
                    : AppColor.mainTextColor3,
                valueCount: toDoProvider.toDoList.length,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Indicator(
                    color: AppColor.contentColorGreen,
                    text: 'Completed',
                    isSquare: false,
                    size: 14,
                    textColor: isTouched == 1
                        ? AppColor.mainTextColor1
                        : AppColor.mainTextColor3,
                    valueCount: 0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    color: AppColor.contentColorOrange,
                    text: 'Pending',
                    isSquare: false,
                    size: 14,
                    textColor: isTouched == 2
                        ? AppColor.mainTextColor1
                        : AppColor.mainTextColor3,
                    valueCount: 0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    color: AppColor.contentColorRed,
                    text: 'Priority',
                    isSquare: false,
                    size: 14,
                    textColor: isTouched == 2
                        ? AppColor.mainTextColor1
                        : AppColor.mainTextColor3,
                    valueCount: 0,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, bottom: 16, right: 32),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceEvenly,
                      maxY: toDoProvider.toDoList.length.toDouble(),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                toY: completedCount.toDouble(),
                                color: AppColor.contentColorGreen,
                                width: 16,
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      priorityCompletedCount.toDouble(),
                                      AppColor.contentColorRed)
                                ]),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                toY: pendingCount.toDouble(),
                                color: AppColor.contentColorOrange,
                                width: 16,
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      priorityPendingCount.toDouble(),
                                      AppColor.contentColorRed)
                                ]),
                          ],
                        ),
                      ],
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              var style = AppTextStyle.normalStyle.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 13);
                              switch (value.toInt()) {
                                case 0:
                                  return Text('Completed', style: style);
                                case 1:
                                  return Text('Pending', style: style);
                                default:
                                  return const Text('');
                              }
                            },
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                      ),
                      gridData: const FlGridData(show: true),
                      borderData: FlBorderData(
                        show: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
