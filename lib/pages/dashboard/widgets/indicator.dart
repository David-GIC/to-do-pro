import 'package:check_list_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
    required this.valueCount,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;
  final int valueCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: AppTextStyle.normalStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            // color: textColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "($valueCount)",
          style: AppTextStyle.normalStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            // color: textColor,
          ),
        ),
      ],
    );
  }
}
