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

Future createNotification() async {
  // Add your function code here!

  print("Checking...");
  DateTime currentTime = DateTime.now();
  print(currentTime.toString());
  for (var project in FFAppState().projects.toList()) {
    if (shouldSendNotification(project)) {
      project.lastTimeNotificationSent = currentTime;

      await FlutterLocalNotificationsPlugin().show(
          0,
          "Add a moment to your project ${project.name}",
          "Tap to add",
          NotificationDetails(
              android: const AndroidNotificationDetails(
                  'projects', 'Notification of your projects',
                  importance: Importance.max,
                  priority: Priority.high,
                  playSound: true,
                  enableVibration: true,
                  icon: "")),
          payload: "/projectPage?projectID=${project.id}");
    } else {}
  }

  print(FFAppState().projects.toList());
}

bool shouldSendNotification(ProjectStruct project) {
  if (project.lastTimeNotificationSent == null) {
    print("Last time notification is nulll");
    return true;
  }
  DateTime currentTime = DateTime.now();
  Duration difference =
      currentTime.difference(project.lastTimeNotificationSent!);

  if (project.reminderUnit.toLowerCase() == 'days') {
    if (difference.inDays >= project.reminderValue) {
      // Perform action when the difference is greater than or equal to reminder value
      // Your action goes here
      // For example, print a message:
      print('Action performed for project: ${project.name}');
      return true; // Return true if action performed
    }
  } else if (project.reminderUnit.toLowerCase() == 'weeks') {
    if (difference.inDays >= (project.reminderValue * 7)) {
      // Perform action when the difference is greater than or equal to reminder value in weeks
      // Your action goes here
      // For example, print a message:
      print('Action performed for project: ${project.name}');
      return true; // Return true if action performed
    }
  } else if (project.reminderUnit.toLowerCase() == 'months') {
    if (difference.inDays >= (project.reminderValue * 30)) {
      // Perform action when the difference is greater than or equal to reminder value in months
      // Your action goes here
      // For example, print a message:
      print('Action performed for project: ${project.name}');
      return true; // Return true if action performed
    }
  }
  return false; // Return false if no action performed
}
