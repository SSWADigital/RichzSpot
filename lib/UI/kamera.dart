// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController _controller;
//   Future<void> _initCameraControllerFuture;
//   bool _isCameraReady;
//   File _imageFile;

//   @override
//   void initState() {
//     super.initState();
//     availableCameras().then((cameras) {
//       if (cameras.length > 0) {
//         _controller = CameraController(cameras[0], ResolutionPreset.high);
//         _isCameraReady = false;
//         _initCameraControllerFuture = _controller.initialize().then((_) {
//           setState(() {
//             _isCameraReady = true;
//           });
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: _isCameraReady == null
//             ? Stack(
//                 children: [
//                   CameraPreview(_controller),
//                   Positioned(
//                     bottom: 10,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         _takePicture();
//                       },
//                       child: Icon(Icons.camera),
//                     ),
//                   ),
//                 ],
//               )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }

//   void _takePicture() async {
//     try {
//       final path = (await getTemporaryDirectory()).path;
//       final imagePath = '$path/${DateTime.now()}.png';
//       await _controller.takePicture(imagePath);
//       setState(() {
//         _imageFile = File(imagePath);
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
