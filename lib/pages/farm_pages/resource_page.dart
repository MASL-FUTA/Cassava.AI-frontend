import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
            ),
            ResourceContainer(
              title: 'Books',
              description: 'Recommended books on agriculture.',
            ),
            ResourceContainer(
              title: 'Achievements',
              description: 'Notable achievements in agriculture.',
            ),
            // Add more ResourceContainer widgets as needed.
          ],
        ),
      ),
    );
  }
}

class ResourceContainer extends StatelessWidget {
  final String title;
  final String description;

  ResourceContainer({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        const  SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
