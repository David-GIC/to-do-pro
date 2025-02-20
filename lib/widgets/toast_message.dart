import 'package:check_list_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void toastMessageSuccess(String msg, BuildContext context,
    {double? offset, Color? color}) {
  showToast(
    msg,
    context: context,
    axis: Axis.horizontal,
    textStyle: AppTextStyle.normalStyle.copyWith(color: Colors.white),
    textPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    borderRadius: BorderRadius.circular(20.0),
    alignment: Alignment.center,
    backgroundColor: color ?? Colors.green,
    animation: StyledToastAnimation.slideFromBottomFade,
    reverseAnimation: StyledToastAnimation.slideToBottomFade,
    startOffset: const Offset(0.0, 3.0),
    reverseEndOffset: const Offset(0.0, 3.0),
    position:
        StyledToastPosition(align: Alignment.topCenter, offset: offset ?? 30.0),
    duration: const Duration(seconds: 4),
    animDuration: const Duration(milliseconds: 400),
    curve: Curves.linearToEaseOut,
    reverseCurve: Curves.fastOutSlowIn,
  );
}

void toastMessageError(String msg, BuildContext context, {double? offset}) {
  showToast(
    msg,
    context: context,
    axis: Axis.horizontal,
    textStyle: AppTextStyle.normalStyle.copyWith(color: Colors.white),
    textPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    borderRadius: BorderRadius.circular(20.0),
    alignment: Alignment.center,
    backgroundColor: Colors.red.shade300,
    animation: StyledToastAnimation.slideFromBottomFade,
    reverseAnimation: StyledToastAnimation.slideToBottomFade,
    startOffset: const Offset(0.0, 3.0),
    reverseEndOffset: const Offset(0.0, 3.0),
    position:
        StyledToastPosition(align: Alignment.topCenter, offset: offset ?? 30.0),
    duration: const Duration(seconds: 6),
    animDuration: const Duration(milliseconds: 400),
    curve: Curves.linearToEaseOut,
    reverseCurve: Curves.fastOutSlowIn,
  );
}
