import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';

import '../../core/utils/global_key_manager.dart';

class ShareScreenWidget extends StatefulWidget {
  const ShareScreenWidget({super.key});

  @override
  ShareScreenWidgetState createState() => ShareScreenWidgetState();
}

class ShareScreenWidgetState extends State<ShareScreenWidget> {
  final GlobalKey globalKey = GlobalKeyManager().globalKey;
  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = (await getApplicationDocumentsDirectory()).path;
      final fileName = path.join(directory, 'screenshot.png');
      final imageFile = File(fileName);
      await imageFile.writeAsBytes(pngBytes);

      await Share.shareXFiles(
        [
          XFile(imageFile.path),
        ],
        text: 'Check this out!',
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Canyon road trip",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.1416),
          child: GestureDetector(
            onTap: _captureAndSharePng,
            child: Icon(
              Icons.reply,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
