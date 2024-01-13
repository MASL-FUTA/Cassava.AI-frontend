import 'package:flutter/material.dart';

class AddNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Task Title'),
          ),
          // Add other form fields (Priority dropdown, calendar picker)
          ElevatedButton(
            onPressed: () {
              // Add logic to save the new task
            },
            child: Text('Proceed'),
          ),
        ],
      ),
    );
  }
}
