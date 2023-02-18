import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/fetcher.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/material.dart';
import 'initInventory.dart';
import "main_page.dart";
import 'nots.dart';

void main() async {
  await init();
  runApp(Minute());

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
  schedueleNotifications();
}

class Minute extends StatefulWidget {
  const Minute({Key? key}) : super(key: key);

  @override
  State<Minute> createState() => _MinuteState();
}

class _MinuteState extends State<Minute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(child: Main()),
    );
  }
}
