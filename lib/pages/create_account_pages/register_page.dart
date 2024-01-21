import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/login_page.dart';


class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello!', style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: Color(0xff242A34),
        ),),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:  EdgeInsets.only(left: 16.0),
              child: Text('Register to get started', style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff242A34)
              ),),
            ),
      ),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ), filled: true,
                fillColor:  Color(0xffF7F8F9) ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),filled: true,fillColor: Color(0xffF7F8F9),),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),filled: true,fillColor: Color(0xffF7F8F9),),
                
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),  
                  filled: true,fillColor: Color(0xffF7F8F9),
                ),
              ),
             const SizedBox(height: 32),
              SizedBox(
                width: 331,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Register logic here
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child:Text('Register', style: TextStyle(color: Colors.white),),
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
          Text(' Or Register with ', style: TextStyle(
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
                children:[const Text('Already, have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const  Text('Log In now', style:TextStyle(
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
