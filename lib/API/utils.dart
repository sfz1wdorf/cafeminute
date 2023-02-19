import 'package:awesome_notifications/awesome_notifications.dart';

String unWhiteSpace(String stringToCheck) {
  return reverse(unWhiteSpaceSub(reverse(unWhiteSpaceSub(stringToCheck))));
}

unWhiteSpaceSub(String stringToCheck) {
  var finished = false;
  while (finished == false) {
    if (stringToCheck[0].toString() == " ") {
      stringToCheck = stringToCheck.toString().substring(1);
    } else {
      break;
    }
  }
  return stringToCheck;
}

String reverse(String s) {
  var sb = new StringBuffer();

  var i = s.length - 1;

  while (i >= 3) {
    sb.writeCharCode(s.codeUnitAt(i - 0));
    sb.writeCharCode(s.codeUnitAt(i - 1));
    sb.writeCharCode(s.codeUnitAt(i - 2));
    sb.writeCharCode(s.codeUnitAt(i - 3));
    i -= 4;
  }

  while (i >= 0) {
    sb.writeCharCode(s.codeUnitAt(i));
    i -= 1;
  }

  return sb.toString();
}

notify() async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body',
          actionType: ActionType.Default),
      schedule: NotificationCalendar.fromDate(
          date: DateTime.now().add(const Duration(seconds: 100))));
}
