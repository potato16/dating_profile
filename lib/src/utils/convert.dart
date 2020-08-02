import 'package:intl/intl.dart';

/// timestamp in seconds.
String timestampToAgeFormat(int timestamp) {
  if (timestamp == null || timestamp < 0) {
    return '';
  }
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final today = DateTime.now();
  final bool passBirthDay =
      DateTime(date.year, today.month, today.day).isAfter(date);
  final age = today.year - date.year - (passBirthDay ? 0 : 1);

  final birthDayFormated = DateFormat('MMM yyyy').format(date);
  return '$birthDayFormated, $age years old';
}

String timestampToDateFormat(int timestamp) {
  if (timestamp == null || timestamp < 0) {
    return '';
  }
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('MM/yy').format(date);
}
