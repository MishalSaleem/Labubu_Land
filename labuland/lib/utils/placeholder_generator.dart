import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<void> generatePlaceholderImages() async {
  final colors = [
    Colors.purple[300]!,
    Colors.amber[300]!,
    Colors.blue[300]!,
    Colors.orange[300]!,
    Colors.green[300]!,
  ];

  for (int i = 0; i < colors.length; i++) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final paint = Paint()..color = colors[i];
    canvas.drawCircle(const Offset(200, 200), 180, paint);

    final detailPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(const Offset(200, 200), 120, detailPaint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(400, 400);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final buffer = byteData!.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/labubu${i + 1}.png');
    await file.writeAsBytes(buffer);

    print('Generated placeholder image: ${file.path}');
  }
}
