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

import 'index.dart'; // Imports other custom actions

import 'package:workmanager/workmanager.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";

Future initWorkerManagerProjectsNotifications() async {
  // Add your function code here!

  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  print("Checking PROJECTS... INIT WORKER MANAGER");

  Workmanager().registerPeriodicTask(
      "check-projects-notifications", "check-projects-notifications",
      tag: "check-projects-notification", frequency: Duration(hours: 1));

  //for testing purposes
  /* Workmanager().registerOneOffTask(
      "check-projects-notifications-", "check-projects-notifications",
      initialDelay: Duration(seconds: 5)); */
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  print("Call back");

  Workmanager().executeTask((task, inputData) async {
    try {
      switch (task) {
        case "check-projects-notifications":
          //add the code here chatgpt pls
          print("CHECKING PROJECT NOTIFICATIONS");
          DateTime currentTime = DateTime.now();

          final backgroundState = FFAppState(); // Initialize FFAppState
          await backgroundState.initializePersistedState();

          print("BACKGROUND: " + backgroundState.projects.toString());

          for (var (index, project)
              in backgroundState.projects.toList().indexed) {
            if (shouldSendNotificationProject(project)) {
              backgroundState.updateProjectsAtIndex(
                  index, (e) => e..lastTimeNotificationSent = currentTime);

              print("AFTER SENT NOTIF: " + backgroundState.projects.toString());

              await FlutterLocalNotificationsPlugin().show(
                  0,
                  "It's time to add a moment to ${project.name}!",
                  "Open the app to add it!",
                  NotificationDetails(
                      android: const AndroidNotificationDetails(
                          'projects', 'Project Reminders',
                          importance: Importance.max,
                          priority: Priority.high,
                          playSound: true,
                          enableVibration: true,
                          icon: "")),
                  payload: "/projectPage?projectID=${project.id}");
            }
          }

          break;
        default:
      }

      return Future.value(true);
    } catch (err) {
      print(err);
      throw Exception(err);
      return Future.value(false);
    }
  });
}
