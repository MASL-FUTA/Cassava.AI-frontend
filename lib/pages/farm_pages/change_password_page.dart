import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/login_page.dart';

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
           const  Text('Your password must be unique from those previously used.'),

           const SizedBox(height: 24.0),
                     
            TextField(              
              controller: oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Old Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE8ECF4)),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
           const SizedBox(height: 16.0),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(color: Color(0xffE8ECF4))
                ),
                 filled: true,
              fillColor: Colors.grey[200],
              ),
             
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(                  
                  borderRadius: BorderRadius.circular(10),
                   borderSide:const BorderSide(color: Color(0xffE8ECF4))
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
           const SizedBox(height: 24.0),
            SizedBox(
              height: 56,
              width: 331,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF026742),
                    shape: RoundedRectangleBorder(                  
                      borderRadius: BorderRadius.circular(10),                  
                    ), 
                    ),              
                onPressed: () {
                  // Handle password reset
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Reset Password',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}