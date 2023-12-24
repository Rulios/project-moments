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

//Code not used because of FlutterFlow limitations

Future navigateTo(
  BuildContext context,
  String path,
  String query,
) async {
  // Add your function code here!
  Map<String, dynamic>? arguments;

  if (query != null) {
    dynamic jsonQuery = jsonDecode(query);
    arguments = jsonQuery;
  }

  await Navigator.of(context).pushNamed(path, arguments: arguments);
}
