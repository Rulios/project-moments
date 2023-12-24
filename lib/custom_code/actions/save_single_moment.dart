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

import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart'; // For MethodChannel

Future<String> saveSingleMoment(FFUploadedFile media) async {
  /// Add your function code here!

  final String appId = 'com.projectmoments'; // Retrieve the app's package name

  final appDir = await getExternalStorageDirectory();
  final momentsDir = Directory('${appDir!.path}/moments');

  if (!await momentsDir.exists()) {
    await momentsDir.create(recursive: true);
  }

  final imageBytes = media.bytes;
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final completePath = '${momentsDir.path}/image_$timestamp.jpg';

  //create file
  final imageFile = File(completePath);
  //save image
  await imageFile.writeAsBytes(imageBytes!);

  return completePath;
}
