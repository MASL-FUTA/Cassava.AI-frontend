import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/login_page.dart';


class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and success message
            Image.asset('assets/images/Successmark.png'),
            
           const Text('Password Changed!', style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w700
            ),),
           const Text('Your password has been \n changed successfully!',style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff8391A1)
           ),),
           const SizedBox(height: 32,),
            SizedBox(
              height: 56,
              width: 331,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the login screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  )); 
                },
                child: Text('Back to LogIn', style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w600, color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(primary: Color(0xFF026742)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
