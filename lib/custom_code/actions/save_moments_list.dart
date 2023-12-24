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
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import "package:file_picker/file_picker.dart";

Future<bool> saveMomentsList(
  List<String>? projectIdReferences,
  Future<dynamic> Function()? triggerUpdateUI,
) async {
  // Add your function code here!

  try {
    final String appId = 'com.projectmoments';
    final appDir = await getExternalStorageDirectory();
    final momentsDir = Directory('${appDir!.path}/moments');

    if (!await momentsDir.exists()) {
      await momentsDir.create(recursive: true);
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      withReadStream: true,
    );

    if (result != null && result.files.isNotEmpty) {
      for (PlatformFile file in result.files) {
        String fileName = path.basenameWithoutExtension(file.name);
        String newPath = '${momentsDir.path}/$fileName.jpg';

        // Copy file to a new directory with .jpg extension
        File newImageFile = File(newPath);
        IOSink sink = newImageFile.openWrite();

        await sink.addStream(file.readStream!);
        await sink.close();

        MomentsStruct newMoment = MomentsStruct(
            id: generateUUID(),
            createdAt: DateTime.now(),
            path: newPath,
            belongsTo: projectIdReferences);

        FFAppState().addToMoments(newMoment);

        if (triggerUpdateUI != null) {
          triggerUpdateUI();
        }
      }
    }
    return true; // Successfully saved all moments
  } catch (e) {
    print('Error saving moments: $e');
    return false; // Failed to save all moments
  }
}
