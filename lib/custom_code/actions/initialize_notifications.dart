// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "package:flutter_local_notifications/flutter_local_notifications.dart";

late BuildContext sharedContext;

Future initializeNotifications(BuildContext context) async {
  // Add your function code here!
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  sharedContext = context;

  await FlutterLocalNotificationsPlugin().initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveLocalNotification,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground);

  print("NOTIFICATIONS SUCCESSFULLY INIT");
}

void onDidReceiveLocalNotification(NotificationResponse response) async {
  // display a dialog with the notification details, tap ok to go to another page

  //due to limitations on FlutterFlow, here it's missing to navigate to the route
  if (response.payload != null) {
    final uri = Uri.parse(response.payload!);
    final routeName = uri.path;
    final parameters = uri.queryParameters;
    //update value on appstate

    //code below doesn't works, but is commented to show intention
    /*print(sharedContext.describeWidget("dawd"));
    sharedContext.goNamed(routeName, queryParameters: parameters);*/
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) async {
  //due to limitations on FlutterFlow, here it's missing to navigate to the route
  if (response.payload != null) {
    final uri = Uri.parse(response.payload!);
    final routeName = uri.path;
    final parameters = uri.queryParameters;
    //update value on appstate
    print(routeName);
  }
}
