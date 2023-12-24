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

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

Future openDirectory(String path) async {
  // Add your function code here!

  final Uri _url = Uri.parse('file:$path');

  try {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  } catch (e) {}
}
