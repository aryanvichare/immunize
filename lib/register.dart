import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:immunize/services/file_storage_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class CameraRegister extends StatefulWidget {
  @override
  _CameraRegisterState createState() => _CameraRegisterState();
}

class _CameraRegisterState extends State<CameraRegister>
    with WidgetsBindingObserver {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;
  bool showCapturedPhoto = false;

  var ImagePath;
  @override
  void initState() {
    super.initState();
    _initializeCamera(null);
  }

  Future<void> _initializeCamera(CameraDescription camera) async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    if (camera == null) {
      camera = firstCamera;
    }

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  void onNewCameraSelected(CameraDescription description) {
    _initializeCamera(description);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (_controller == null || !_controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller != null) {
        onNewCameraSelected(_controller.description);
      }
    }
  }

void onCaptureButtonPressed() async {  //on camera button press
  try {

    final path = join(
      (await getTemporaryDirectory()).path, //Temporary path
      '${DateTime.now()}.png',
    );
    ImagePath = path;
    await _controller.takePicture(path); //take photo

    setState(() {
      showCapturedPhoto = true;
    });
  } catch (e) {
    print(e);
  }
}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (showCapturedPhoto) {
            return Scaffold(
              body: Column(children: [
                Text(
                  "Take a selfie",
                  style: TextStyle(color: Color.fromARGB(255, 45, 76, 198), fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Text(
                  "This is to verify your face.",
                  style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
                ),
                Expanded(child: Image.file(File(ImagePath))),
                Row(children: [
                  ElevatedButton(
                    onPressed: () { /* Submit */ },
                    child: Text('Submit', style: TextStyle(fontSize: 20))
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 235, 235, 235)),
                    onPressed: () { setState(() { showCapturedPhoto= false; }); },
                    child: Text('Retake', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 45, 76, 198)))
                  )
                ],)
              ])
            );
          }

          // If the Future is complete, display the preview.
          return Scaffold(
            body: Column(children:[
              Text(
                "Welcome!",
                style: TextStyle(color: Color.fromARGB(255, 45, 76, 198), fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(color: Color.fromARGB(255, 196, 196, 196), fontSize: 12, fontWeight: FontWeight.w400)
              ),
              Transform.scale(
              scale: _controller.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller), //cameraPreview
                ),
              ))
              ]),
            floatingActionButton: FloatingActionButton(
              onPressed: onCaptureButtonPressed,
              child: Icon(Icons.add),
            )
            );
        } else {
          return Center(
              child:
                  CircularProgressIndicator()); // Otherwise, display a loading indicator.
        }
      },
    );
  }
}
