


import 'package:date_time_format/date_time_format.dart';

String formatToRelativeTime(String timeStamp) {

  final parsedTime = DateTime.parse(timeStamp);
  final time = DateTimeFormat.relative(parsedTime, abbr: true);
  return time;
}