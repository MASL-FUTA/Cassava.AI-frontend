import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/create_account_pages/login_page.dart';
import 'package:masl_futa_agric/pages/create_account_pages/viewmodel/register_view_model.dart';
import 'package:masl_futa_agric/service/api_service.dart';
import 'package:masl_futa_agric/utils/colors.dart';
import 'package:stacked/stacked.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final ApiService apiService = ApiService();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.nonReactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Hello!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Color(0xff242A34),
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Register to get started',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff242A34)),
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: model.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.fillColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: model.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.fillColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: model.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.fillColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: model.cPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.fillColor,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 331,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => model.signUp(context),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xffE8ECF4),
                          height: 50,
                        ),
                      ),
                      Text(
                        ' Or Register with ',
                        style: TextStyle(
                          color: Color(0xffA1A9B3),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xffE8ECF4),
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
                          icon: const Icon(
                            Icons.facebook,
                            color: Color(0xff4092FF),
                          ),
                          label: const Text('Facebook'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 148,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Implement Google login logic here
                          },
                          icon: const Icon(Icons.g_mobiledata_rounded),
                          label: const Text('Google'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already, have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          'Log In now',
                          style: TextStyle(
                            color: Color(0xFF026742),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
