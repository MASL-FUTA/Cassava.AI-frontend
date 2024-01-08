import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/password_changed_success.dart';


class CreateNewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),  
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),  
                filled: true,)
            ),
           const SizedBox(height: 32),
            SizedBox(
              width: 331,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to update the password
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SuccessPage(),
                  ));
                },
                child: Text('Reset Password', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(primary: Color(0xFF026742),
                shape: RoundedRectangleBorder(                  
                  borderRadius: BorderRadius.circular(10),                  
                ),
                ),),
              
            ),
          ],
        ),
      ),
    );
  }
}
