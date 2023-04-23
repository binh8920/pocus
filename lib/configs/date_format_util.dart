import 'package:intl/intl.dart';

abstract class DateFormatUtil {
  const DateFormatUtil._();

  static String formattedDate(DateTime _date) {
    return DateFormat('MM/dd/yyyy').format(_date);
  }
}
