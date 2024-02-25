import 'package:flutter/material.dart';
import 'package:masl_futa_agric/utils/colors.dart';

class Snackbar {
  static show(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: AppColors.appColor,
      ),
    );
  }
}
