import 'dart:async';
import 'package:flutter/material.dart';

import 'package:manual_camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(CameraApp());
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      cameras[1],
      ResolutionPreset.medium,
      iso: 1000,
      shutterSpeed: 10,
      whiteBalance: WhiteBalancePreset.cloudy,
      focusDistance: 0.1,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
        title: 'App name',
        home: Scaffold(
            appBar: AppBar(
              title: Text("FOR UMUT KOCABAŞ"),
            ),
            body: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller))));
  }
}
