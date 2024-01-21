import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: Column(
        children: [
          MoreItem(text: 'Terms and Conditions'),
          MoreItem(text: 'FAQ'),
          MoreItem(text: 'Support'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle logout action
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}

class MoreItem extends StatelessWidget {
  final String text;

  MoreItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
