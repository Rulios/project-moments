import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

String generateUUID() {
  // function uuid generator
  var rng = math.Random();
  var codeUnits = List.generate(16, (index) {
    final value = rng.nextInt(255);
    if (index == 6) {
      return value & 0x0f | 0x40;
    } else if (index == 8) {
      return value & 0x3f | 0x80;
    } else {
      return value;
    }
  });

  return List.generate(16, (index) {
    return codeUnits[index].toRadixString(16).padLeft(2, '0');
  }).join();
}

int getProjectIndexById(
  String projectId,
  List<ProjectStruct> projects,
) {
// Iterate through the list of projects.
  for (int i = 0; i < projects.length; i++) {
    // If the project ID matches, return the index.
    if (projects[i].id == projectId) {
      return i;
    }
  }

  // If the project is not found, return -1.
  return -1;
}

int convertStringToInt(String string) {
  int tries;

  if (string == null) {
    return 0;
  }

  try {
    tries = int.parse(string);
  } catch (err) {
    return 0;
  }

  return tries;
}

List<MomentsStruct> reverseMoments(List<MomentsStruct> moments) {
  return moments.reversed.toList();
}

int getMomentIndexById(
  String id,
  List<MomentsStruct> moments,
) {
  // Iterate through the list of moments.
  for (int i = 0; i < moments.length; i++) {
    // If the moment ID matches, return the index.
    if (moments[i].id == id) {
      return i;
    }
  }

  // If the moment is not found, return -1.
  return -1;
}

List<ProjectStruct> reverseProjects(List<ProjectStruct> projects) {
  return projects.reversed.toList();
}

List<MomentsStruct> sortMomentsByDate(
  List<MomentsStruct> moments,
  SortOrders order,
) {
  if (order == SortOrders.ASCENDING) {
    moments.sort((a, b) {
      final createdAtA = a.createdAt;
      final createdAtB = b.createdAt;

      if (createdAtA == null && createdAtB == null) {
        return 0;
      } else if (createdAtA == null) {
        return 1;
      } else if (createdAtB == null) {
        return -1;
      }

      return createdAtA.compareTo(createdAtB);
    });
  } else if (order == SortOrders.DESCENDING) {
    moments.sort((a, b) {
      final createdAtA = a.createdAt;
      final createdAtB = b.createdAt;

      if (createdAtA == null && createdAtB == null) {
        return 0;
      } else if (createdAtA == null) {
        return -1;
      } else if (createdAtB == null) {
        return 1;
      }

      return createdAtB.compareTo(createdAtA);
    });
  }
  return moments;
}

bool shouldSendNotificationProject(ProjectStruct project) {
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

String? extractUriElements(
  String elementType,
  String uriString,
) {
  Uri uri = Uri.parse(uriString);

  if (elementType == 'path') {
    return uri.path;
  } else if (elementType == 'query') {
    Map<String, String> queryParams = uri.queryParameters;
    return json.encode(queryParams);
  }

  return null; // Return null for invalid inputs or missing key
}
