// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'dart:io';

class LocalImageWidget extends StatefulWidget {
  const LocalImageWidget({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit,
    this.showCached,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;
  final String? fit;
  final bool? showCached;

  @override
  _LocalImageWidgetState createState() => _LocalImageWidgetState();
}

class _LocalImageWidgetState extends State<LocalImageWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure the super method is called

    return Image.file(
      File(widget.imageUrl),
      width: widget.width,
      height: widget.height,
      cacheWidth:
          (widget.showCached != null) ? widget.width!.toInt() ~/ 2 : null,
      fit: widget.fit != null
          ? (widget.fit == 'cover' ? BoxFit.cover : BoxFit.contain)
          : BoxFit.cover,
    );
  }
}
