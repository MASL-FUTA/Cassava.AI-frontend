import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/otp_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password?',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: Color(0xff242A34)
        ),),

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text("Don't worry! It occurs. Please enter the email address linked with your account.", 
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff242A34)
              ),),
      ),),
        ),),
        
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter your Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffE8ECF4),
                )
              ),
            ),),
            const SizedBox(height: 32),
            SizedBox(
              width: 331,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Implement logic to send OTP to the provided email
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OtpScreen(),
                  ));
                },
                child:  Text('Send Code', style: TextStyle(
                  fontSize: 14,fontWeight: FontWeight.w600, color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(primary: Color(0xFF026742),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),),
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
