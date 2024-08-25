import 'package:check_list_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class DialogWidget {
  static void showDialogMessage(String msg, BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: const Text(
                "Message",
              ),
              content: Text(
                msg.toString(),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "OK",
                    )),
              ],
            ));
  }

  static void confirmDialog(
      {required BuildContext context,
      required Function onApprove,
      String? title}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "Confirm",
                style: AppTextStyle.normalStyle
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              content: Text(title ?? "Are you sure?",
                  style: AppTextStyle.normalStyle),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: AppTextStyle.normalStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onApprove();
                  },
                  child: Text(
                    'Sure',
                    style: AppTextStyle.normalStyle,
                  ),
                ),
              ],
            ));
  }
}
