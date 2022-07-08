import 'package:intl/intl.dart';

class TimeHelper {
  static DateTime format() {
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    const time = "11:00:00";
    final completeFormat = DateFormat('y/M/d H:m:s');

    final today = dateFormat.format(now);
    final todayAndTime = "$today $time";
    var resultToday = completeFormat.parseStrict(todayAndTime);

    var formatted = resultToday.add(const Duration(days: 1));
    final nextDay = dateFormat.format(formatted);
    final nextDayAndTime = "$nextDay $time";
    var resultTomorrow = completeFormat.parseStrict(nextDayAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}
