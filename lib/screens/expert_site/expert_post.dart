import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(Problem());
}

class Problem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expert Questions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpertScreen(),
    );
  }
}

class ExpertScreen extends StatefulWidget {
  @override
  _ExpertScreenState createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  List<QuestionItem> _questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expert Questions'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return _questions[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addQuestion,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addQuestion() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _questions.add(
          QuestionItem(
            imagePath: pickedFile.path,
            isImage: true,
          ),
        );
      });
    } else {
      print('No image selected.');
    }
  }
}

class QuestionItem extends StatelessWidget {
  final String imagePath;
  final bool isImage;

  QuestionItem({
    required this.imagePath,
    required this.isImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: isImage ? Image.file(File(imagePath)) : VideoPlayerWidget(videoPath: imagePath),
      // You can add more information or actions related to the question here.
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  VideoPlayerWidget({required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CircularProgressIndicator(); // Show loading indicator until the video is initialized.
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
