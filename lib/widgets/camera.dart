import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();

    // Initialize the camera
    availableCameras().then((cameras) {
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[0], ResolutionPreset.medium);
        _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _isCameraReady = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the camera controller when no longer needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _isCameraReady
            ? CameraPreview(_controller) // Display the camera preview
            : CircularProgressIndicator(), // Show loading indicator until camera is ready
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isCameraReady
              ? () {
                  // Take a photo when the camera icon is tapped
                  _takePhoto();
                }
              : null, // Disable the button if the camera is not ready
          child: Text('Take Photo'),
        ),
      ],
    );
  }

  void _takePhoto() async {
    try {
      final XFile photo = await _controller.takePicture();

      // Do something with the taken photo (e.g., save it, display it, etc.)

      // Navigate to a screen to display or process the photo
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PhotoPreviewScreen(photoPath: photo.path),
      //   ),
      // );
    } catch (e) {
      print('Error taking photo: $e');
    }
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    initializeCamera(); // Initialize the camera in the initState method

    // Initialize the video player
    _videoController = VideoPlayerController.network(
      'https://www.example.com/sample.mp4', // Replace with your video URL here
    )..initialize().then((_) {
        setState(() {});
      });
  }

  // Initialize the camera
  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
      await _cameraController.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  void _takePhoto() async {
    // Implement logic to take a photo using the camera
    if (_cameraController != null && _cameraController.value.isInitialized) {
      XFile? photo = await _cameraController.takePicture();
      // Implement navigation or other actions with the taken photo
    }
  }

  void _recordVideo() async {
    // Implement logic to record a video using the camera
    // You can use _cameraController.startVideoRecording() and _cameraController.stopVideoRecording()
  }

  void _pickFromGallery() async {
    // Implement logic to pick an image or video from the gallery
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // Implement navigation or other actions with the picked file
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Options'),
      ),
      body: Stack(
        children: [
          // Background Animation (You can replace this with your animation)
          Container(
            width: double.infinity,
            height: double.infinity,
            color:
                Colors.blue, // Replace with your animation or background color
          ),
          _cameraController != null && _cameraController.value.isInitialized
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: CameraPreview(_cameraController),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _takePhoto();
                      },
                      child: Text('Take Photo'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _recordVideo();
                      },
                      child: Text('Record Video'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pickFromGallery();
                      },
                      child: Text('Pick from Gallery'),
                    ),
                    // User Guidance
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Tap "Take Photo" to capture an image from the camera',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Tap "Record Video" to start recording a video',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Tap "Pick from Gallery" to select an image or video from your device',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
