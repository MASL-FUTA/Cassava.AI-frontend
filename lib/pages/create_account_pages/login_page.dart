import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/forget_password_page.dart';
import 'package:masl_futa_agric/pages/create_account_pages/register_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Welcome back!', style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: Color(0xff242A34),
        ),),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Glad to see you, Again!', style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff242A34)
              ),),
            ),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
          fillColor: Colors.grey[200],
        
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(labelText: 'Enter your password',
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),  
                  filled: true,
          fillColor: Colors.grey[200],
             suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
                ),
              ),),
             //const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Navigate to the forgot password screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child:  Text('Forgot Password?' ,)),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 331,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement login logic here
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage()));
                  },
                  child:   Text('Log In', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(primary: Color(0xFF026742),
                  shape: RoundedRectangleBorder(                  
                    borderRadius: BorderRadius.circular(10),                  
                  ),                
                  ),
                ),
              ),
             const SizedBox(height: 32),
                       const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Expanded(
        child: Divider(
          color:  Color(0xffE8ECF4),
          height: 50,
        ),
          ),
          Text(' Or login with ', style: TextStyle(
        color: Color(0xffA1A9B3),
        fontSize: 14,
        fontWeight: FontWeight.w600,
          ),),
          
          Expanded(
        child: Divider(
          color:  Color(0xffE8ECF4),
          height: 50,
        ),
          ),
          ],
          ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 148,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Implement Facebook login logic here
                      },
                      icon: const Icon(Icons.facebook, color: Color(0xff4092FF),),
                      label: const Text('Facebook'),
                      style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),),
                  SizedBox(
                     width: 148,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Implement Google login logic here
                      },
                      icon: const Icon(Icons.g_mobiledata_rounded),
                      label: const Text('Google'),
                       style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),
                  ),),)
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                },
                child: const  Text('Register now', style:TextStyle(
                  color: Color(0xFF026742),
                ),
                ),
              ),],),
            ],
          ),
        ),
      ),
    );
  }
}
