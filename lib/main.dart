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
      ResolutionPreset.ultraHigh,
      iso: 200,
      shutterSpeed: 1000,
      whiteBalance: WhiteBalancePreset.cloudy,
      focusDistance: 0.1,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      Future.delayed(Duration(
        milliseconds: 1000,
      ));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MartilarTK',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("For Martilartk"),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller)),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.shutterSpeed = controller.shutterSpeed + 50;
                      controller.initialize().then((_) {
                        if (!mounted) {
                          return;
                        }
                        setState(() {});
                        Future.delayed(Duration(
                          milliseconds: 1000,
                        ));
                      });
                    },
                    child: const Text("Shutter Arttır"),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(30, 7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      backgroundColor: const Color(0xFF00c8ff),
                      surfaceTintColor: const Color(0x0f000000),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.shutterSpeed = controller.shutterSpeed - 50;
                      controller.initialize().then((_) {
                        if (!mounted) {
                          return;
                        }
                        setState(() {});
                        Future.delayed(Duration(
                          milliseconds: 1000,
                        ));
                      });
                    },
                    child: const Text("Shutter Azalt"),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(30, 7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      backgroundColor: const Color(0xFF00c8ff),
                      surfaceTintColor: const Color(0x0f000000),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.iso = controller.iso + 20;

                      controller.initialize().then((_) {
                        if (!mounted) {
                          return;
                        }
                        setState(() {});
                        Future.delayed(Duration(
                          milliseconds: 1000,
                        ));
                      });
                    },
                    child: const Text("iso Arttır"),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(30, 7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      backgroundColor: const Color(0xFF00c8ff),
                      surfaceTintColor: const Color(0x0f000000),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.iso = controller.iso - 20;

                      controller.initialize().then((_) {
                        if (!mounted) {
                          return;
                        }
                        setState(() {});
                        Future.delayed(Duration(
                          milliseconds: 1000,
                        ));
                      });
                    },
                    child: const Text("iso Azalt"),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(30, 7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      backgroundColor: const Color(0xFF00c8ff),
                      surfaceTintColor: const Color(0x0f000000),
                    ),
                  ),
                ],
              ),
            ]))));
  }
}
