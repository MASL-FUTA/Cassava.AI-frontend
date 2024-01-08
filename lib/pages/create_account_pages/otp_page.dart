import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/create_new_password.dart';


class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification', style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w700, color: Color(0xff1E232C)
        ),),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Enter the OTP sent to your email address', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff8391A1)
              ),),
            ),
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 40,),
            // Containers to display OTP code
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    for (int i = 0; i < 4; i++)
      Container(
        width: 50,
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,

          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            counterText: '',            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0xff013A25)),
            ),
          ),
        ),
      ),
  ],
),
const SizedBox(height: 32, ),
            // Implement logic to verify OTP
             SizedBox(
              width: 331,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewPasswordPage()));
                },
                child:   Text('Verify', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(primary: Color(0xFF026742),
                shape: RoundedRectangleBorder(                  
                  borderRadius: BorderRadius.circular(10),                  
                ),                
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[const Text('didn\'t receive the code'),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
              },
              child: const  Text('Resend', style:TextStyle(
                color: Color(0xFF026742),
              ),
              ),
            ),],),
          ],
        ),
      ),
    );
  }
}
