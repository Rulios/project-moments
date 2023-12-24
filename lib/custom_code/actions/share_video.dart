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

import 'package:share_plus/share_plus.dart';

Future shareVideo(String videoPath) async {
  // Add your function code here!

  final result =
      await Share.shareXFiles([XFile('${videoPath}')], text: 'Great picture');

  if (result.status == ShareResultStatus.success) {
    print('Thank you for sharing your moments! :)');
  }
}
