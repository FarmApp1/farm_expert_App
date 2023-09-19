import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  bool isCameraVisible = false;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    // Initialize the camera
    availableCameras().then((cameraList) {
      cameras = cameraList;
      if (cameras != null && cameras!.isNotEmpty) {
        _cameraController = CameraController(
          cameras![0], // Use the first available camera
          ResolutionPreset.medium,
        );
        initializeCamera();
      }
    });
  }

  Future<void> initializeCamera() async {
    await _cameraController.initialize();
    if (mounted) {
      setState(() {
        isCameraVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void toggleCameraVisibility() {
    setState(() {
      isCameraVisible = !isCameraVisible;
    });
  }

  void _takePhoto() async {
    // Implement logic to take a photo using the camera
    if (_cameraController != null && _cameraController.value.isInitialized) {
      XFile? photo = await _cameraController.takePicture();
      // Implement navigation or other actions with the taken photo
    }
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
          // Background Image or Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background_image.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
            child: isCameraVisible
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
                      // Add more buttons or UI elements here
                    ],
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: () {
                        toggleCameraVisibility();
                      },
                      child: Text('Show Camera'),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
