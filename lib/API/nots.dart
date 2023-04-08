import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/API/fetcher.dart';
import 'package:cafeminute/API/utils.dart';
import 'package:flutter/material.dart';
import '../main.dart';

import '../product_view.dart';

initNots() {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
sendNotifications() async{
  print("nots called");
  var notsServer = await getHttp("$url/fetchnotification", "", "GET");
  if(notsServer.toString() != "nv"){
    print(notsServer.toString());
  var fetchedNots = fetchNot(notsServer.toString());
  AwesomeNotifications().createNotification(
  content: NotificationContent(
    //id:heading;id:content;id:date;id:time;id:dateformated;
      id: 10,
      channelKey: 'basic_channel',
      title: fetchedNots[0],
      body: fetchedNots[1],
      actionType: ActionType.Default
  )
);
  }
}

List<String> fetchNot(String nots){
var notsUnclean = nots.split(";");
var notsCleaned = [unWhiteSpace(notsUnclean[0].substring(6,unWhiteSpace(notsUnclean[0]).length)),unWhiteSpace(notsUnclean[1].substring(6,unWhiteSpace(notsUnclean[1]).length))];
return notsCleaned;
}
