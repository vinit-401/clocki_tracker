import 'package:intl/intl.dart';

String getDate(String created) {
  if (created == null || created.isEmpty) {
    return '';
  }
  DateTime parseDate;
  String formattedDate;

  parseDate = DateTime.parse(created);
  formattedDate = DateFormat('dd/MM/yyyy').format(parseDate);

  return formattedDate;
}

String getYear(String created) {
  if (created == null || created.isEmpty) {
    return '';
  }
  DateTime parseDate;
  String formattedDate;

  parseDate = DateTime.parse(created);
  formattedDate = DateFormat('yyyy').format(parseDate);

  return formattedDate;
}

String getDateYY(String created) {
  if (created == null || created.isEmpty) {
    return '';
  }
  DateTime parseDate;
  String formattedDate;

  parseDate = DateTime.parse(created);
  formattedDate = DateFormat('dd/MM/yy').format(parseDate);

  return formattedDate;
}

convertStringToDate(dateString) {
  DateFormat dateFormat = DateFormat("dd/MM/yy");
  DateTime date = dateFormat.parse(dateString);
  return date;
}

bool isValidDate(String dateString) {
  try {
    DateFormat dateFormat = DateFormat('dd/MM/yy');
    dateFormat
        .parseStrict(dateString); // Throws an error if the format doesn't match
    return true; // If parsing succeeds, it's a valid date
  } catch (e) {
    return false; // If parsing fails, it's not a valid date
  }
}

String getTime(String created) {
  if (created == null || created.isEmpty) {
    return '';
  }
  DateTime parseDate;
  try {
    parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(created);
  } catch (e) {
    var dateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(created, true);
    parseDate = dateTime.toLocal();
  }
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('HH:mm:ss');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

String getPassDate(String created) {
  if (created == null || created.isEmpty) {
    return '';
  }
  DateTime parseDate;
  try {
    parseDate = DateFormat("yyyy-MM-dd").parse(created);
  } catch (e) {
    var dateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(created, true);
    parseDate = dateTime.toLocal();
  }
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('yyyy-MM-dd');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

// A
/// Check date it today or not
bool isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

String getTimeStamps(int millis) {
  final DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
  final DateFormat formatter = DateFormat('HH:m \na');
  return formatter.format(date
      .toUtc()); // convert time in UTC as server is also returning UTC formates
}

String getDateTime(String dateTimeString) {
  if (dateTimeString != "-") {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('d MMM HH:mm:ss a');
    return formatter.format(dateTime);
  } else {
    return "-";
  }
}
