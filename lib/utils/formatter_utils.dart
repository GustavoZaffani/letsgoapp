import 'package:intl/intl.dart';

String formatTimer(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;

  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$hoursStr:$minutesStr:$secondsStr';
}

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('dd/MM/yyyy HH:mm');
  return formatter.format(dateTime);
}
