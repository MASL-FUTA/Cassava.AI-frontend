import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:masl_futa_agric/pages/farm_pages/dashboard_page.dart';
import 'package:masl_futa_agric/repo/auth_repo.dart';
import 'package:masl_futa_agric/utils/snackbar.dart';
import 'package:stacked/stacked.dart';

class AUthViewModel extends BaseViewModel {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController=> _nameController;
  TextEditingController _cPasswordController = TextEditingController();
  TextEditingController get cPasswordController=> _cPasswordController;

  bool _loading = false;
  bool get loading => _loading;

  signIn(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty) {
      return;
    }
    if (password.isEmpty) {
      return;
    }
    setLoading(true);
    var res = await AuthRepo.signIn(email, password);
    setLoading(false);
    if (res.success && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else {
      Fluttertoast.showToast(msg: res.message);
    }
  }

  setLoading(bool input) {
    _loading = input;
    notifyListeners();
  }


  signUp(BuildContext context) async {
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
    if (email.isEmpty) {
      return;
    }
    if (password.isEmpty) {
      return;
    }
    var res = await AuthRepo.signUp(email, password);
    if (res.success && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else {
      Fluttertoast.showToast(msg: res.message);
    }
  }
}
