import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masl_futa_agric/utils/snackbar.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel{
  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController=> _nameController;
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController=> _emailController;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController=> _passwordController;
  TextEditingController _cPasswordController = TextEditingController();
  TextEditingController get cPasswordController=> _cPasswordController;

  signUp(BuildContext context) {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword =cPasswordController.text.trim();


    if (name.isEmpty) {
      Snackbar.show(context, "Name can't be empty");
      return;
    }
    if (email.isEmpty) {
      Snackbar.show(context, "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      Snackbar.show(context, "Password can't be empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      Snackbar.show(context, "Confirm password can't be empty");
      return;
    }
    if (password != confirmPassword) {
      Snackbar.show(context, "Passwords don't match");
      return;
    }
  }

  register() {

  }

  setEmailController(TextEditingController controller){
    _emailController = controller;
    notifyListeners();
  }

  setPasswordController(TextEditingController controller){
    _passwordController = controller;
    notifyListeners();
  }

  setCPasswordController(TextEditingController controller){
    _cPasswordController = controller;
    notifyListeners();
  }
}