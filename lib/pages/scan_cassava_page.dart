import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScanCassavaPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const ScanCassavaPage({required this.cameras});

  @override
  _ScanCassavaPageState createState() => _ScanCassavaPageState();
}

class _ScanCassavaPageState extends State<ScanCassavaPage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.cameras[0], // Use the first available camera
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Cassava'),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            // Take a picture and get the file path
            final XFile picture = await _cameraController.takePicture();

            // Add logic to save the picture and get details here

            // Navigate to a page to show details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CassavaDetailsPage(imagePath: picture.path),
              ),
            );
          } catch (e) {
            print('Error: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}

class CassavaDetailsPage extends StatelessWidget {
  final String imagePath;

  const CassavaDetailsPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Add logic to extract details from the image
    // You can use a plugin like ML Kit for this purpose

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cassava Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(
            File(imagePath),
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20.0),
          Text('Details extracted from the image will be displayed here.'),
        ],
      ),
    );
  }
}
