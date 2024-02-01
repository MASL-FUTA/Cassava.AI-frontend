import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Your password must be unique from those previously used.'),
            TextField(
              controller: oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Old Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle password reset
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}