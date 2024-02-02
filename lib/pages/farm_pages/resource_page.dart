import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
              image: 'assets/images/resource3.png',
            ),
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
              image: 'assets/images/resource2.png',
            ),
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
              image: 'assets/images/resource1.png',
            ),
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
              image: 'assets/images/resource3.png',
            ),
            ResourceContainer(
              title: 'News',
              description: 'Latest agriculture news and updates.',
              image: 'assets/images/resource2.png',
            ),
            ResourceContainer(
              title: 'Books',
              description: 'Recommended books on agriculture.',
              image: 'assets/images/resource1.png',
            ),
            ResourceContainer(
              title: 'Achievements',
              description: 'Notable achievements in agriculture.',
              image: 'assets/images/resource2.png',
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
  final String image;

  ResourceContainer(
      {required this.title, required this.description, required this.image});

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
          Image.asset(
            image,
            width: 328,
            height: 158,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff026742)),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Color(0xff6A6A6A)),
          ),
        ],
      ),
    );
  }
}
