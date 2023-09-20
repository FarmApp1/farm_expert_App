import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  final picker = ImagePicker();
  bool _showLogo = true;

  Future<void> _takePicture() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      _navigateToDescriptionScreen(File(pickedImage.path));
    }
  }

  Future<void> _openGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _navigateToDescriptionScreen(File(pickedImage.path));
    }
  }

  void _navigateToDescriptionScreen(File imageFile) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageDescriptionScreen(imageFile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showLogo
                ? Image.asset(
                    'assets/images/plant.png', // Replace with your image path
                    height: 200,
                    width: 200.0,
                  )
                : Container(),
            _imageFile == null
                ? Container()
                : Image.file(
                    _imageFile!,
                    height: 200.0,
                  ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 160.0,
                  height: 50.0,
                  child: ElevatedButton.icon(
                    onPressed: _takePicture,
                    icon: Icon(Icons.camera),
                    label: Text('Take Picture'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 160.0,
                  height: 50.0,
                  child: ElevatedButton.icon(
                    onPressed: _openGallery,
                    icon: Icon(Icons.photo),
                    label: Text('Open Gallery'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDescriptionScreen extends StatefulWidget {
  final File imageFile;

  ImageDescriptionScreen(this.imageFile);

  @override
  _ImageDescriptionScreenState createState() => _ImageDescriptionScreenState();
}

class _ImageDescriptionScreenState extends State<ImageDescriptionScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String recordedAudioPath = ''; // Store the recorded audio file path

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (!isRecording) {
      // Start recording audio
      String tempPath = 'path_to_temp_audio_file'; // Replace with actual path
      // You can use a package like audioplayers_record to record audio.
      // Make sure to import and follow its documentation.
      // Example:
      // await audioRecorder.start(path: tempPath, audioOutputFormat: AudioOutputFormat.AAC);
      setState(() {
        isRecording = true;
        recordedAudioPath = tempPath;
      });
    } else {
      // Stop recording audio
      // Example:
      // await audioRecorder.stop();
      setState(() {
        isRecording = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Description'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.file(widget.imageFile, height: 200.0),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter a detailed description...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 16.0,
                ),
                suffixIcon: isRecording
                    ? IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          _toggleRecording();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {
                          _toggleRecording();
                        },
                      ),
              ),
              maxLines: 4,
              // Add recorded audio to the description
              initialValue: recordedAudioPath,
            ),
          ),
          SizedBox(height: 16.0),
          if (recordedAudioPath.isNotEmpty)
            Column(
              children: [
                Text('Recorded Audio:'),
                // Display the audio player for the recorded audio
                AudioPlayerWidget(recordedAudioPath),
              ],
            ),
        ],
      ),
    );
  }
}

class AudioPlayerWidget extends StatelessWidget {
  final String audioFilePath;

  var AudioSource;

  AudioPlayerWidget(this.audioFilePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Create a new AudioPlayer object
            final audioPlayer = AudioPlayer();

            // Convert the audio file path to a Source object
            final source = AudioSource.uri(audioFilePath, isLocal: true);

            // Play recorded audio
            audioPlayer.play(source);
          },
          child: Text('Play Recorded Audio'),
        ),
      ],
    );
  }
}
