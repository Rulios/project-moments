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

import 'package:path_provider/path_provider.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'dart:io';

Future<String> generateVideo(
  List<MomentsStruct>? moments,
  int? speed,
  Future<dynamic> Function() onStartRender,
  Future<dynamic> Function() onSuccessRender,
  Future<dynamic> Function() onFailRender,
) async {
  // Add your function code here!

  if (moments == null || moments.isEmpty || speed == null || speed <= 0) {
    return ''; // Return an empty string or handle the invalid input case
  }

  onStartRender();

  final appDir = await getExternalStorageDirectory();
  final timestamp = DateTime.now().millisecondsSinceEpoch;

  final outputVideoPath =
      '${appDir?.path}/compiled/compiled_video_$timestamp.mp4';

  final tempFilePath = '${appDir?.path}/compiled/temporal_src_$timestamp.txt';

  //CREATE 'COMPILED' DIRECTORY
  final compiledDir = Directory('${appDir!.path}/compiled');
  if (!await compiledDir.exists()) {
    await compiledDir.create(recursive: true);
  }

  //STEP #1 - Create temporary file to store the addresses of the files
  // --format of temp file---
  // file /address/to/file
  File tempFile = File(tempFilePath);

  try {
    IOSink sink = tempFile.openWrite(mode: FileMode.append);

    for (final moment in moments) {
      final mediaPath = moment.path; // Get the path for each moment
      sink.write("file $mediaPath\n");
    }

    await sink.close();
    print("Files addresses added to temp file");
  } catch (e) {
    print("Error: $e");
  }

  //STEP #2 - RUN FFMPEG COMMAND
  final ffmpegCommand = StringBuffer();

  final double duration =
      moments.length.toDouble() / speed.toDouble(); // Calculate the duration

  //arguments to apply
  const String squareResolution = "1080";
  const String disableHardwareAccel = " -hwaccel none ";
  final String framerate = " -r $speed ";
  final String inputFile = " -safe 0 -f concat -i $tempFilePath ";
  const String backgroundBlurFilter =
      "-vf '[0:v]split=2[blur][vid];[blur]scale=1080:1080:force_original_aspect_ratio=increase,crop=1080:1080,boxblur=luma_radius=min(h\\,w)/20:luma_power=1:chroma_radius=min(cw\\,ch)/20:chroma_power=1[bg];[vid]scale=1080:1080:force_original_aspect_ratio=decrease[ov];[bg][ov]overlay=(W-w)/2:(H-h)/2'";
  const String videoCodec = " -c:v libx264 ";
  const String audioCodec = " -c:a aac ";
  const String compatibility = " -level 3.0 -pix_fmt yuv420p ";
  const String allowOverwrite = " -y ";
  // Construct the complete command
  final String command = ffmpegCommand.toString() +
      framerate +
      disableHardwareAccel +
      inputFile +
      backgroundBlurFilter +
      videoCodec +
      compatibility +
      audioCodec +
      allowOverwrite +
      outputVideoPath;

  //CREATE THE VIDEO MP4 FILE
  File file = File(outputVideoPath);
  try {
    await file.create(); // Use await to create the file asynchronously

    if (file.existsSync()) {
      stdout.writeln('File created: ${file.path}');
    } else {
      stdout.writeln('Error creating file');
    }
  } catch (e) {
    print('Error: $e');
  }

  // Execute FFmpeg command and wait for the result
  FFmpegKit.executeAsync(
          command,
          (session) async {
            final state =
                FFmpegKitConfig.sessionStateToString(await session.getState());
            final returnCode = await session.getReturnCode();
            final failStackTrace = await session.getFailStackTrace();
            final duration = await session.getDuration();

            //this.hideProgressDialog();

            if (ReturnCode.isSuccess(returnCode)) {
              stdout.writeln(
                  "Encode completed successfully in ${duration} milliseconds; playing video.");
              await tempFile.delete();
              onSuccessRender();
            } else {
              //delete the temp file and video file
              await tempFile.delete();
              await file.delete();
              stdout
                  .writeln("Encode failed. Please check log for the details.");
              stdout.writeln(
                  "Encode failed with state ${state} and rc ${returnCode}.${failStackTrace}");
              onFailRender();
            }
          },
          (log) => stdout.writeln(log.getMessage()),
          (statistics) {
            //this._statistics = statistics;
            //this.updateProgressDialog();
          })
      .then((session) => stdout.writeln(
          "Async FFmpeg process started with sessionId ${session.getSessionId()}."));

  return outputVideoPath; // Return the path of the compiled video
}
