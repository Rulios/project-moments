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
import 'dart:typed_data';

Future<FFUploadedFile?> getImageBytesFromURI(String url) async {
  // Add your function code here!

  if (url == null || url.isEmpty) {
    return null;
  }

  File file = File(url);

  if (!file.existsSync()) {
    return null;
  }

  try {
    List<int> imageBytes = file.readAsBytesSync();
    return FFUploadedFile(
      bytes: Uint8List.fromList(imageBytes),
      name: file.path.split('/').last,
      height: 0, // Update with the actual image height
      width: 0, // Update with the actual image width
      blurHash: '', // Generate blurhash if necessary
    );
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
