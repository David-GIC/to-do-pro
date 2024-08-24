import 'package:intl/intl.dart';

class CommonUtils {
  static formatDateTime(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd kk:mm a");
    String string = dateFormat.format(date);
    return string;
  }
}
